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

tag0=`getprop ro.crypto.state unencrypted`
case "$tag0" in "encrypted")
    firstboot=`getprop persist.lge.appman.firstboot 1`
    case "$firstboot" in "1")
        setprop persist.lge.appman.installstart 1
        setprop persist.lge.appman.firstboot 0
    esac
esac

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
esac


CURRENT=`getprop ro.build.version.incremental 0`
tag3=`getprop persist.lge.appman.errc_done 1`
if [ "$tag3" != "$CURRENT" ]; then

# should be removed on N OS
    if [ -f /system/etc/uid_lgapp.cfg ]; then
        for module in $(cat /system/etc/uid_lgapp.cfg); do
			for userNum in $(ls /data/user); do
			    userExp=`expr $userNum \* 100000 + 2901`
				chown -R ${userExp}:${userExp} /data/user/${userNum}/${module}
			done
	    done
	fi
	
	if [ -f /system/etc/uid_system.cfg ]; then
        for module in $(cat /system/etc/uid_system.cfg); do
			for userNum in $(ls /data/user); do
			    userExp=`expr $userNum \* 100000 + 1000`
				chown -R ${userExp}:${userExp} /data/user/${userNum}/${module}
			done
	    done
	fi
	
    if [ -f /system/etc/errc_devA.cfg ]; then     	       
        for module in $(cat /system/etc/errc_devA.cfg); do
            rm -rf /data/app-system/${module}
            rm -rf /data/app-system/${module}.apk
            rm -rf /data/app-system/${module}-*
            
            rm -rf /data/app/${module}
            rm -rf /data/app/${module}.apk
            rm -rf /data/app/${module}-*
			
            rm -rf /data/preload/${module}
            rm -rf /data/preload/${module}.apk
            rm -rf /data/preload/${module}-*
        done
    fi
    
    if [ -f /system/etc/errc_list.cfg ]; then     	       
        for module in $(cat /system/etc/errc_list.cfg); do
            rm -rf /data/app-system/${module}
            rm -rf /data/app-system/${module}.apk
            rm -rf /data/app-system/${module}-*
            
            rm -rf /data/app/${module}
            rm -rf /data/app/${module}.apk
            rm -rf /data/app/${module}-*
			
            rm -rf /data/preload/${module}
            rm -rf /data/preload/${module}.apk
            rm -rf /data/preload/${module}-*
        done
    fi
	
    setprop persist.lge.appman.errc_done $CURRENT
fi


exit 0
