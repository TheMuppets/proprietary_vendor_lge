#!/system/bin/sh

OPERATOR=`getprop ro.build.target_operator`
COUNTRY=`getprop ro.build.target_country`
DELAPK=`getprop ro.lge.capp_del_country_apk`
BUILD_TYPE=`getprop ro.build.type`
UI_BASE_CA=`getprop ro.build.ui_base_ca`
MCCMNC_LIST=`getprop persist.sys.mccmnc-list`
SUBSET_LIST=`getprop persist.sys.subset-list`
MCC=`getprop persist.sys.ntcode`
IS_MULTISIM=`getprop ro.lge.sim_num`
MCC=${MCC:5:3}

NAVIGON_FOLDER_PATH=/data/media/0/navigon
if [ $OPERATOR != "GLOBAL" ]; then
    if [ $IS_MULTISIM == "2" ]; then
        ITEM=${OPERATOR}_${COUNTRY}_DS
    elif [ $IS_MULTISIM == "3" ]; then
        ITEM=${OPERATOR}_${COUNTRY}_TS
    else
        ITEM=${OPERATOR}_${COUNTRY}
    fi
    # Delete other operator dir
#    if [ $BUILD_TYPE == "user" ]; then
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
        if [ $OPERATOR = "TMO" ] && [ $MCC != "262" ]; then
                if [ -d $NAVIGON_FOLDER_PATH ]; then
                    rm -rf $NAVIGON_FOLDER_PATH
                fi
        fi
        setprop persist.data.sbp.update 2
else
        #Delete navigon data for cts testing
        if [ $MCC = "999" ]; then
                if [ -d $NAVIGON_FOLDER_PATH ]; then
                    rm -rf $NAVIGON_FOLDER_PATH
                fi
        fi
        setprop persist.data.sbp.update 0
#    fi
fi

exit 0
