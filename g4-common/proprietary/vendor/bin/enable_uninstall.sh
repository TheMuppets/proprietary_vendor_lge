#!/system/bin/sh
# This script installs apks in /system/uninstallable directory
# when the phone is first booted after the factory reset.
#
# Apks installed via this script can be uninstalled by user.
# However, uninstallation does not remove an apk from the system image.
# Furthermore, the apks are again installed after a factory reset.
#
# Apks listed in the config file /cust/config/appmanager.cfg won't
# be neither installed or managed by Application Manager.

ORIGIN_PATH=/system/apps/bootup
TARGET_PATH=/data/app

tag1=`getprop persist.lge.appman.installstart 1`
case "$tag1" in "1")
    for file in $(ls -s ${TARGET_PATH})
    do
        r=${file//[0-9]/}
	if [ -z "$r" ]
	then
            if [ "$file" -gt "50" ]
            then
                setprop persist.lge.appman.installstart 0
                break;
            fi
        fi
    done
esac

tag2=`getprop persist.lge.appman.installstart 1`
case "$tag2" in
    "1")     
     #L script
          for file in $(ls -a ${ORIGIN_PATH}/*/*.apk)
     do
        if [ "$file" != "." -a "$file" != ".." ]
	then
		ln -s ${file} ${TARGET_PATH}/${file##*/}
	fi
     done

    #CUPSS
    custdir=`getprop ro.lge.capp_cupss.rootdir /cust`

    CONFIG_FILE=$custdir/config/appmanager.cfg

    if [ -f $CONFIG_FILE ]
    then
        for apk in $(cat $CONFIG_FILE); do
            `rm $TARGET_PATH/$apk > /dev/null`
        done
    fi

    setprop persist.lge.appman.installstart 0
     ;;
    
    
    #KK->L FOTA case - link need to change
    "0")
    for line in $(ls -a -l ${TARGET_PATH})
    do
        if [ ${line} != ${line##/system/apps/bootup/} ]; then
        FILE_PATH=${line##*/}
        FILE_WITH_PARENT=${line##/system/apps/bootup/}


            if [ "$FILE_PATH" == "$FILE_WITH_PARENT" ]     #No subfolder
            then
                 for file in $(ls -a ${ORIGIN_PATH}/*/${FILE_PATH}); do
                     rm ${TARGET_PATH}/${file##*/}
                     ln -s ${file} ${TARGET_PATH}/${file##*/}
                 done
            fi
        fi
    done
    ;;
esac

tag3=`getprop persist.lge.appman.errc_done 1`
case "$tag3" in "1")
    #if [ -f /system/etc/errc_kk2l.cfg ]; then     	       
    #for module in $(cat /system/etc/errc_kk2l.cfg); do
    if [ -f /system/etc/errc_kk2l.cfg ]; then     	       
        for module in $(cat /system/etc/errc_kk2l.cfg); do
            rm -rf ${DATA_SYSTEM}/${module}
            rm -rf ${DATA_SYSTEM}/${module}.apk
            rm -rf ${DATA_SYSTEM}/${module}-*
            rm -rf ${DATA_SYSTEM}/${module}-*.apk
            
            rm -rf /data/app/${module}
            rm -rf /data/app/${module}.apk
            rm -rf /data/app/${module}-*.apk
        done
    fi
    setprop persist.lge.appman.errc_done 0
esac
    
    CARRIER=`getprop ro.build.target_operator`


    if [ "$CARRIER" == "SKT" ]; then
	/system/vendor/bin/tphone.sh
    fi

exit 0
