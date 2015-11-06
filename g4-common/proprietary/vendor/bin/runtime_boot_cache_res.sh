#!/system/bin/sh

OPERATOR=`getprop ro.build.target_operator`
COUNTRY=`getprop ro.build.target_country`
BUILD_TYPE=`getprop ro.build.type`
DCOUNTRY=`getprop ro.build.default_country`
UI_BASE_CA=`getprop ro.build.ui_base_ca`
MCC=`getprop ro.lge.ntcode_mcc`
LGBOOTANIM=`getprop ro.lge.firstboot.openani`
IS_MULTISIM=`getprop ro.lge.sim_num`

SYSTEM_BOOTANIMATION_FILE=/system/media/bootanimation.zip
SYSTEM_BOOTANIMATION_SOUND_FILE=/system/media/audio/ui/PowerOn.ogg
CACHE_BOOTANIMATION_FILE=/persist-lg/poweron/bootanimation.zip
CACHE_BOOTANIMATION_SOUND_FILE=/persist-lg/poweron/PowerOn.ogg
COTA_BOOTANIMATION_FILE=/cust/_COTA_RES/bootanimation.zip
COTA_BOOTANIMATION_SOUND_FILE=/cust/_COTA_RES/PowerOn.ogg


if [ $DCOUNTRY != "" ]; then
    if [ $UI_BASE_CA != "NO" ]; then
        SUBCA_FILE=${UI_BASE_CA}/${DCOUNTRY}
    else
        if [ $IS_MULTISIM == "2" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_DS/${DCOUNTRY}
            if [ ! -d /cust/${SUBCA_FILE} ]; then
                SUBCA_FILE=${OPERATOR}_${COUNTRY}/${DCOUNTRY}
            fi
        elif [ $IS_MULTISIM == "3" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_TS/${DCOUNTRY}
            if [ ! -d /cust/${SUBCA_FILE} ]; then
                SUBCA_FILE=${OPERATOR}_${COUNTRY}/${DCOUNTRY}
            fi
        else
            SUBCA_FILE=${OPERATOR}_${COUNTRY}/${DCOUNTRY}
        fi
    fi
else
    if [ $UI_BASE_CA != "NO" ]; then
        SUBCA_FILE=${UI_BASE_CA}
    else
        if [ $IS_MULTISIM == "2" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_DS
            if [ ! -d /cust/${SUBCA_FILE} ]; then
                SUBCA_FILE=${OPERATOR}_${COUNTRY}
            fi
        elif [ $IS_MULTISIM == "3" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_TS
            if [ ! -d /cust/${SUBCA_FILE} ]; then
                SUBCA_FILE=${OPERATOR}_${COUNTRY}
            fi
        else
            SUBCA_FILE=${OPERATOR}_${COUNTRY}
        fi
    fi
fi

#/system/bin/mkdir /persist-lg/poweron 0771 system system
#/system/bin/chown -R system:sytem /persist-lg/poweron
#/system/bin/chmod -R 0775 /persist-lg/poweron

if [ $(ls /cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip | grep bootanimation_${MCC}.zip) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
    else
        DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
    fi
else
    DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation.zip
fi

if [ $(ls /cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg | grep PowerOn_${MCC}.ogg) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
    else
        DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
    fi

else
    DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn.ogg
fi

rm $CACHE_BOOTANIMATION_FILE
rm $CACHE_BOOTANIMATION_SOUND_FILE

if [ $OPERATOR != "GLOBAL" ]; then
    if [ -f $COTA_BOOTANIMATION_FILE ]; then
        ln -sf $COTA_BOOTANIMATION_FILE $CACHE_BOOTANIMATION_FILE
    else
        if [ -f $DOWNCA_BOOTANIMATION_FILE ]; then
            if [ $(ls /cust/${SUBCA_FILE}/poweron/nobootani_${MCC}.open) ]; then
                ln -s $SYSTEM_BOOTANIMATION_FILE $CACHE_BOOTANIMATION_FILE
            else
                ln -s $DOWNCA_BOOTANIMATION_FILE $CACHE_BOOTANIMATION_FILE
            fi
        fi
    fi

    if [ -f $COTA_BOOTANIMATION_SOUND_FILE ]; then
        ln -sf $COTA_BOOTANIMATION_SOUND_FILE $CACHE_BOOTANIMATION_SOUND_FILE
    else
        if [ -f $DOWNCA_BOOTANIMATION_SOUND_FILE ]; then
            if [ $(ls /cust/${SUBCA_FILE}/poweron/nobootani_sound_${MCC}.open) ]; then
                ln -s $SYSTEM_BOOTANIMATION_SOUND_FILE $CACHE_BOOTANIMATION_SOUND_FILE
            else
                ln -s $DOWNCA_BOOTANIMATION_SOUND_FILE $CACHE_BOOTANIMATION_SOUND_FILE
            fi
        fi
    fi
fi
exit 0
