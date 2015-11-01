#!/system/bin/sh

OPERATOR=`getprop ro.build.target_operator`
COTA_FLAG=`getprop persist.sys.cota.changed`

if [ "$COTA_FLAG" == "2" ]; then
    # set 3 to distinguish cota task done
    setprop persist.sys.cota.changed 3
    exit 0
fi

if [ $OPERATOR == "GLOBAL" -a "$COTA_FLAG" == "1" ]; then
    # In case of SUPERSET in MID process,
    # prevent copying cota bootanimation, in ResourcePackageManagmer, to cust.
    setprop persist.sys.cota.changed 2
    exit 0
fi

/system/bin/chown -R system:system /data/shared/cust
/system/bin/chmod 775 /data/shared/cust
/system/bin/chmod 775 /data/shared/cust/*

/system/bin/chown -R system:system /cust/_COTA_RES
/system/bin/chmod 775 /cust/_COTA_RES
/system/bin/chmod 775 /cust/_COTA_RES/*

if [ $(ls /data/shared/cust/PowerOn.ogg) ]; then
    cp -pf /data/shared/cust/PowerOn.ogg /cust/_COTA_RES
fi

if [ $(ls /data/shared/cust/bootanimation.zip) ]; then
    cp -pf /data/shared/cust/bootanimation.zip /cust/_COTA_RES

fi

if [ "$COTA_FLAG" == "1" ]; then
    # Trigger For cust partition rw remount
    setprop persist.sys.cota.changed 2
fi

exit 0
