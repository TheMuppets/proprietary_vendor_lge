#!/system/bin/sh

OPERATOR=`getprop ro.build.target_operator`
COUNTRY=`getprop ro.build.target_country`
DELAPK=`getprop ro.lge.capp_del_country_apk`
BUILD_TYPE=`getprop ro.build.type`
UI_BASE_CA=`getprop ro.build.ui_base_ca`
CUPSS_ROOT_DIR=`getprop ro.lge.capp_cupss.rootdir`
CUPSS_PROP_FILE=`getprop persist.sys.cupss.subca-prop`
MCCMNC_LIST=`getprop persist.sys.mccmnc-list`
SUBSET_LIST=`getprop persist.sys.subset-list`
MCC=`getprop persist.sys.ntcode`
IS_MULTISIM=`getprop ro.lge.sim_num`
MCC=${MCC:5:3}

if [ $OPERATOR != "GLOBAL" ]; then
    if [ $CUPSS_ROOT_DIR == "/data/local/cust" ]; then
        CUPSS_SUBCA=${CUPSS_PROP_FILE##*cust_}
        CUPSS_SUBCA=${CUPSS_SUBCA%.prop}

        if [ $IS_MULTISIM == "2" ]; then
            CUPSS_PATH=${CUPSS_SUBCA}_DS
        elif [ $IS_MULTISIM == "3" ]; then
            CUPSS_PATH=${CUPSS_SUBCA}_TS
        fi
        if [ -d /data/.OP/${CUPSS_SUBCA} ] || [ -d /data/.OP/${CUPSS_PATH} ]; then
            ITEM=${CUPSS_SUBCA}
        else
            CUPSS_CA=${CUPSS_SUBCA%_*}
            ITEM=${CUPSS_CA}
        fi
    else
        ITEM=${OPERATOR}_${COUNTRY}
    fi

    if [ $IS_MULTISIM == "2" ]; then
        if [ -d /data/.OP/${ITEM}_DS ]; then
            ITEM=${ITEM}_DS
        fi
    elif [ $IS_MULTISIM == "3" ]; then
        if [ -d /data/.OP/${ITEM}_TS ]; then
            ITEM=${ITEM}_TS
        fi
    fi

    # Delete other operator dir
    #if [ $BUILD_TYPE == "user" ]; then
	ls /data/.OP > /data/del_entry
	for del_item in `cat /data/del_entry`
	do
		if [ $del_item != $ITEM ] && [ $del_item != apps ] && [ $del_item != userdata.ubid ] && [ $del_item != app-enabled-conf.json ]; then
			if [ -z $UI_BASE_CA ] || [ $del_item != $UI_BASE_CA ]; then
				rm -rf /data/.OP/$del_item
			fi
		elif [ $del_item = $ITEM ] && [ $DELAPK = "true" ]; then
			IS_SUPERSET_NTCODE=false
			# Check More than 1 NTcode status
			if [ "${#MCCMNC_LIST}" -gt 5 -a "${#SUBSET_LIST}" -gt 2 ]; then
				LAST_MCCMNC=${MCCMNC_LIST##*,}
				LAST_SUBSET=${SUBSET_LIST##*,}

				# Check Last NTCODE is SUPERSET
				if [ "${LAST_MCCMNC}" == 999999 -a "${LAST_SUBSET}" == 99 ]; then
					IS_SUPERSET_NTCODE=true
				fi
			fi
			if [ "${IS_SUPERSET_NTCODE}" == false ]; then
				NTCODE_FILE_LIST_PATH=/persist-lg/tmo/file_list
				for del_apk_item in `ls /data/.OP/${ITEM}/apps`
				do
					if [ "`grep -c $del_apk_item $NTCODE_FILE_LIST_PATH`" -eq "0" ]; then
						rm -f /data/.OP/${ITEM}/apps/$del_apk_item
					fi
				done
			fi
		fi
	done
	rm /data/del_entry

	setprop persist.data.sbp.update 2
    #fi
else

    setprop persist.data.sbp.update 0
fi

exit 0
