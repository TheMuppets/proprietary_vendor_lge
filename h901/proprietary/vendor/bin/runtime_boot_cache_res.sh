#!/system/bin/sh

OPERATOR=`getprop ro.build.target_operator`
COUNTRY=`getprop ro.build.target_country`
BUILD_TYPE=`getprop ro.build.type`
DCOUNTRY=`getprop ro.build.default_country`
UI_BASE_CA=`getprop ro.build.ui_base_ca`
MCC=`getprop persist.sys.ntcode`
FIRSTPOWERON=`getprop persist.radio.first-mccmnc`
LGBOOTANIM=`getprop ro.lge.firstboot.openani`
CUPSS_ROOT_DIR=`getprop ro.lge.capp_cupss.rootdir`
CUPSS_PROP_FILE=`getprop persist.sys.cupss.subca-prop`
CUPSS_CHANGED=`getprop persist.sys.cupss.changed`
IS_MULTISIM=`getprop ro.lge.sim_num`
MCC=${MCC#*,}
MCC=${MCC:1:3}

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
        elif [ $IS_MULTISIM == "3" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_TS/${DCOUNTRY}
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
        elif [ $IS_MULTISIM == "3" ]; then
            SUBCA_FILE=${OPERATOR}_${COUNTRY}_TS
        else
            SUBCA_FILE=${OPERATOR}_${COUNTRY}
        fi
    fi
fi

#/system/bin/mkdir /persist-lg/poweron 0771 system system
#/system/bin/chown -R system:sytem /persist-lg/poweron
#/system/bin/chmod -R 0775 /persist-lg/poweron

if [ $CUPSS_ROOT_DIR == "/data/local/cust" ]; then
    if [ ! -d ${CUPSS_ROOT_DIR} ]; then
        mkdir ${CUPSS_ROOT_DIR}
        /system/bin/chmod 755 ${CUPSS_ROOT_DIR}
    fi

    if [ ${CUPSS_CHANGED} == "1" ]; then
        if [ ! -d ${CUPSS_ROOT_DIR}/prev ]; then
            mkdir ${CUPSS_ROOT_DIR}/prev
            /system/bin/chmod 755 ${CUPSS_ROOT_DIR}/prev
        fi
        mv -f ${CUPSS_ROOT_DIR}/* ${CUPSS_ROOT_DIR}/prev
    fi

    CUPSS_SUBCA=${CUPSS_PROP_FILE##*cust_}
    CUPSS_SUBCA=${CUPSS_SUBCA%.prop}
    if [ $IS_MULTISIM == "2" ]; then
        OPEN_PATH=/cust/OPEN_COM_DS
    elif [ $IS_MULTISIM == "3" ]; then
        OPEN_PATH=/cust/OPEN_COM_TS
    else
        OPEN_PATH=/cust/OPEN_COM
    fi

    DIRLIST=$(ls ${OPEN_PATH})
    for DIR in ${DIRLIST}; do
        if [ -d ${OPEN_PATH}/${DIR} ]; then
            DIRNAME=${DIR#_}
            if [ -h ${CUPSS_ROOT_DIR}/${DIRNAME} ] || [ ! -d ${CUPSS_ROOT_DIR}/${DIRNAME} ]; then
                if [ -d ${OPEN_PATH}/${DIR}/${DIRNAME}_${CUPSS_SUBCA} ]; then
                    ln -sfn ${OPEN_PATH}/${DIR}/${DIRNAME}_${CUPSS_SUBCA} ${CUPSS_ROOT_DIR}/${DIRNAME}
                else
                    ln -sfn ${OPEN_PATH}/${DIR}/${DIRNAME}_${OPERATOR}_${COUNTRY} ${CUPSS_ROOT_DIR}/${DIRNAME}
                fi
            fi
        fi
    done
fi

if [ $CUPSS_ROOT_DIR == "/data/local/cust" ]; then
# bootanimation for OPEN_COM
if [ $(ls ${CUPSS_ROOT_DIR}/config/poweron/bootanimation_${MCC}.zip | grep bootanimation_${MCC}.zip) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_FILE=${CUPSS_ROOT_DIR}/config/poweron/bootanimation_${MCC}.zip
        fi
    else
        DOWNCA_BOOTANIMATION_FILE=${CUPSS_ROOT_DIR}/config/poweron/bootanimation_${MCC}.zip
    fi
else
    DOWNCA_BOOTANIMATION_FILE=${CUPSS_ROOT_DIR}/config/poweron/bootanimation.zip
fi

if [ $(ls ${CUPSS_ROOT_DIR}/config/poweron/PowerOn_${MCC}.ogg | grep PowerOn_${MCC}.ogg) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_SOUND_FILE=${CUPSS_ROOT_DIR}/config/poweron/PowerOn_${MCC}.ogg
        fi
    else
        DOWNCA_BOOTANIMATION_SOUND_FILE=${CUPSS_ROOT_DIR}/config/poweron/PowerOn_${MCC}.ogg
    fi

else
    DOWNCA_BOOTANIMATION_SOUND_FILE=${CUPSS_ROOT_DIR}/config/poweron/PowerOn.ogg
fi

else
# bootanimaiton for Operators
if [ $(ls /cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip | grep bootanimation_${MCC}.zip) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
        fi
    else
        DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
    fi
else
    DOWNCA_BOOTANIMATION_FILE=/cust/${SUBCA_FILE}/poweron/bootanimation.zip
fi

if [ $(ls /cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg | grep PowerOn_${MCC}.ogg) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
        fi
    else
        DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
    fi

else
    DOWNCA_BOOTANIMATION_SOUND_FILE=/cust/${SUBCA_FILE}/poweron/PowerOn.ogg
fi
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
