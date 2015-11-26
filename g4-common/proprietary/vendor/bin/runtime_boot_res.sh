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
IS_COTA_CHANGED=`getprop persist.sys.cota.changed`
IS_MULTISIM=`getprop ro.lge.sim_num`

MCC=${MCC#*,}
MCC=${MCC:1:3}

USER_BOOTANIMATION_FILE=/data/local/bootanimation.zip
USER_BOOTANIMATION_SOUND_FILE=/data/local/PowerOn.ogg
USER_SHUTDOWNANIMATION_FILE=/data/local/shutdownanimation.zip
USER_SHUTDOWNANIMATION_SOUND_FILE=/data/local/PowerOff.ogg
USER_APP_MANAGER_INSTALLATION_FILE=/data/local/app-ntcode-conf.json

COTA_BOOTANIMATION_FILE=/cust/_COTA_RES/bootanimation.zip
COTA_BOOTANIMATION_SOUND_FILE=/cust/_COTA_RES/PowerOn.ogg
COTA_SHUTDOWNANIMATION_FILE=/data/shared/cust/shutdownanimation.zip
COTA_SHUTDOWNANIMATION_SOUND_FILE=/data/shared/cust/PowerOff.ogg

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

if [ ! -d "/cust/_COTA_RES" ]; then
    if [ $(ls /data/shared/cust/bootanimation.zip) ]; then
        setprop persist.sys.cota.changed 1
    fi
fi

/system/bin/chown -R system:system /data/.OP
/system/bin/chmod -R 0771 /data/.OP
/system/bin/chmod -R 0644 /data/.OP/$SUBCA_FILE/power*/*
/system/bin/chmod -R 0755 /data/.OP/apps/*
/system/bin/chmod -R 0755 /data/.OP/*/apps/*
/system/bin/chmod -R 0644 /data/.OP/*/prop
/system/bin/chmod 0644 /data/.OP/app-enabled-conf.json
/system/bin/chown -R system:system /data/preload
/system/bin/chmod 775 /data/preload/*
/system/bin/chmod 755 /data/preload/*/*
/system/bin/chown -R media_rw:media_rw /data/media/0/Preload
/system/bin/chmod 775 /data/media/0/Preload
/system/bin/chmod 775 /data/media/0/Preload/LG
/system/bin/chmod 755 /data/shared
/system/bin/chmod 755 /data/local/cust

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
    CUPSS_CA=${CUPSS_SUBCA%_*}

    if [ $IS_MULTISIM == "2" ]; then
        OPEN_PATH=/cust/OPEN_COM_DS
        if [ ! -d ${OPEN_PATH} ]; then
            OPEN_PATH=/cust/OPEN_COM
        fi
    elif [ $IS_MULTISIM == "3" ]; then
        OPEN_PATH=/cust/OPEN_COM_TS
        if [ ! -d ${OPEN_PATH} ]; then
            OPEN_PATH=/cust/OPEN_COM
        fi
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
                    ln -sfn ${OPEN_PATH}/${DIR}/${DIRNAME}_${CUPSS_CA} ${CUPSS_ROOT_DIR}/${DIRNAME}
                fi
            fi
        fi
    done
fi

DOWNCA_APP_MANAGER_INSTALLATION_FILE=/data/.OP/app-enabled-conf.json

if [ $(ls /data/.OP/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip | grep bootanimation_${MCC}.zip) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
        fi
    else
        DOWNCA_BOOTANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweron/bootanimation_${MCC}.zip
    fi
else
    DOWNCA_BOOTANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweron/bootanimation.zip
fi

if [ $(ls /data/.OP/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg | grep PowerOn_${MCC}.ogg) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_BOOTANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
        fi
    else
        DOWNCA_BOOTANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweron/PowerOn_${MCC}.ogg
    fi

else
    DOWNCA_BOOTANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweron/PowerOn.ogg
fi

if [ $(ls /data/.OP/${SUBCA_FILE}/poweroff/shutdownanimation_${MCC}.zip | grep shutdownanimation_${MCC}.zip) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_SHUTDOWNANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweroff/shutdownanimation_${MCC}.zip
        fi
    else
        DOWNCA_SHUTDOWNANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweroff/shutdownanimation_${MCC}.zip
    fi

else
    DOWNCA_SHUTDOWNANIMATION_FILE=/data/.OP/${SUBCA_FILE}/poweroff/shutdownanimation.zip
fi

if [ $(ls /data/.OP/${SUBCA_FILE}/poweroff/PowerOff_${MCC}.ogg | grep PowerOff_${MCC}.ogg) ]; then
    if [ $LGBOOTANIM != "" ] && [ $LGBOOTANIM == "true" ]; then
        if [ $FIRSTPOWERON != "" ]; then
            DOWNCA_SHUTDOWNANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweroff/PowerOff_${MCC}.ogg
        fi
    else
        DOWNCA_SHUTDOWNANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweroff/PowerOff_${MCC}.ogg
    fi

else
    DOWNCA_SHUTDOWNANIMATION_SOUND_FILE=/data/.OP/${SUBCA_FILE}/poweroff/PowerOff.ogg
fi

if [ $OPERATOR != "GLOBAL" ]; then

    rm $USER_BOOTANIMATION_FILE
    rm $USER_BOOTANIMATION_SOUND_FILE
    rm $USER_SHUTDOWNANIMATION_FILE
    rm $USER_SHUTDOWNANIMATION_SOUND_FILE

    if [ -f $DOWNCA_BOOTANIMATION_FILE ]; then
        if [ ! $(ls /data/.OP/${SUBCA_FILE}/poweron/nobootani_${MCC}.open) ]; then
            ln -s $DOWNCA_BOOTANIMATION_FILE $USER_BOOTANIMATION_FILE
        fi
    fi

    if [ -f $DOWNCA_BOOTANIMATION_SOUND_FILE ]; then
        if [ ! $(ls /data/.OP/${SUBCA_FILE}/poweron/nobootani_sound_${MCC}.open) ]; then
            ln -s $DOWNCA_BOOTANIMATION_SOUND_FILE $USER_BOOTANIMATION_SOUND_FILE
        fi
    fi

    if [ -f $DOWNCA_SHUTDOWNANIMATION_FILE ]; then
        if [ ! $(ls /data/.OP/${SUBCA_FILE}/poweroff/noshutdownani_${MCC}.open) ]; then
            ln -s $DOWNCA_SHUTDOWNANIMATION_FILE $USER_SHUTDOWNANIMATION_FILE
        fi
    fi

    if [ -f $DOWNCA_SHUTDOWNANIMATION_SOUND_FILE ]; then
        if [ ! $(ls /data/.OP/${SUBCA_FILE}/poweroff/noshutdownani_sound_${MCC}.open) ]; then
            ln -s $DOWNCA_SHUTDOWNANIMATION_SOUND_FILE $USER_SHUTDOWNANIMATION_SOUND_FILE
        fi
    fi

    if [ -f $COTA_BOOTANIMATION_FILE ]; then
        ln -sf $COTA_BOOTANIMATION_FILE $USER_BOOTANIMATION_FILE
    fi

    if [ -f $COTA_BOOTANIMATION_SOUND_FILE ]; then
        ln -sf $COTA_BOOTANIMATION_SOUND_FILE $USER_BOOTANIMATION_SOUND_FILE
    fi

    if [ -f $COTA_SHUTDOWNANIMATION_FILE ]; then
        ln -sf $COTA_SHUTDOWNANIMATION_FILE $USER_SHUTDOWNANIMATION_FILE
    fi

    if [ -f $COTA_SHUTDOWNANIMATION_SOUND_FILE ]; then
        ln -sf $COTA_SHUTDOWNANIMATION_SOUND_FILE $USER_SHUTDOWNANIMATION_SOUND_FILE
    fi

else
    rm $USER_APP_MANAGER_INSTALLATION_FILE
    if [ -f $DOWNCA_APP_MANAGER_INSTALLATION_FILE ]; then
        ln -sf $DOWNCA_APP_MANAGER_INSTALLATION_FILE $USER_APP_MANAGER_INSTALLATION_FILE
    fi
fi

#Single CA Google submission
if [ $OPERATOR != "GLOBAL" ]; then
    rm -f $USER_APP_MANAGER_INSTALLATION_FILE

    SINGLECA_ENABLE=`getprop ro.lge.singleca.enable`
    SINGLECA_SUBMIT=`getprop ro.lge.singleca.submit`
    if [ "${SINGLECA_ENABLE}" == "1" -a "${SINGLECA_SUBMIT}" == "1" ]; then
        if [ -f $DOWNCA_APP_MANAGER_INSTALLATION_FILE ]; then
            ln -sf $DOWNCA_APP_MANAGER_INSTALLATION_FILE $USER_APP_MANAGER_INSTALLATION_FILE
        fi
    fi
fi

CUST_AUDIO_PATH=/cust/${SUBCA_FILE}/media/audio
CUST_RINGTONE_PATH=${CUST_AUDIO_PATH}/ringtones
CUST_NOTIFICATION_PATH=${CUST_AUDIO_PATH}/notifications
CUST_ALARM_ALERT_PATH=${CUST_AUDIO_PATH}/alarms

USER_MEDIA_PATH=/data/local/media
USER_AUDIO_PATH=/${USER_MEDIA_PATH}/audio
USER_RINGTONE_PATH=${USER_AUDIO_PATH}/ringtones
USER_NOTIFICATION_PATH=${USER_AUDIO_PATH}/notifications
USER_ALARM_ALERT_PATH=${USER_AUDIO_PATH}/alarms

rm -rf $USER_MEDIA_PATH

IS_SUBCA_EXIST=$(ls -R ${CUST_AUDIO_PATH} | grep "\_[0-9]\{3\}\.")
if [ $? -eq 0 ]; then
    mkdir -p $USER_AUDIO_PATH
    mkdir $USER_RINGTONE_PATH
    mkdir $USER_NOTIFICATION_PATH
    mkdir $USER_ALARM_ALERT_PATH
    chmod 755 $USER_MEDIA_PATH
    chmod 755 -R $USER_MEDIA_PATH/*
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    if [ -d ${CUST_RINGTONE_PATH} ]; then
        if [ ! $(ls /cust/${SUBCA_FILE}/config/noringtone.open) ]; then
        CUST_RINGTONE_FILES=$(ls ${CUST_RINGTONE_PATH} | grep ${MCC})
        if [ $? -eq 0 ]; then
            for CUST_RINGTONE_FILE in ${CUST_RINGTONE_FILES}; do
                    RINGTONE_EXTENTION=${CUST_RINGTONE_FILE##*.}
                    RINGTONE_FILE_NAME=${CUST_RINGTONE_FILE%%_${MCC}*}
                    cp -p ${CUST_RINGTONE_PATH}/${CUST_RINGTONE_FILE} ${USER_RINGTONE_PATH}/${RINGTONE_FILE_NAME}.${RINGTONE_EXTENTION}
            done
        else
            RINGTONE_FILES=$(ls ${CUST_RINGTONE_PATH} | grep -v "\_[0-9]\{3\}\.")
            if [ $? -eq 0 ]; then
                for RINGTONE_FILE in ${RINGTONE_FILES}; do
                    cp -p ${CUST_RINGTONE_PATH}/${RINGTONE_FILE} ${USER_RINGTONE_PATH}/${RINGTONE_FILE}
                done
            fi
        fi
    fi
    fi
    if [ -d ${CUST_NOTIFICATION_PATH} ]; then
        if [ ! $(ls /cust/${SUBCA_FILE}/config/nonotification.open) ]; then
        CUST_NOTIFICATION_FILES=$(ls ${CUST_NOTIFICATION_PATH} | grep ${MCC})
        if [ $? -eq 0 ]; then
            for CUST_NOTIFICATION_FILE in ${CUST_NOTIFICATION_FILES}; do
                    NOTIFICATION_EXTENTION=${CUST_NOTIFICATION_FILE##*.}
                    NOTIFICATION_FILE_NAME=${CUST_NOTIFICATION_FILE%%_${MCC}*}
                    cp -p ${CUST_NOTIFICATION_PATH}/${CUST_NOTIFICATION_FILE} ${USER_NOTIFICATION_PATH}/${NOTIFICATION_FILE_NAME}.${NOTIFICATION_EXTENTION}
            done
        else
            NOTIFICATION_FILES=$(ls ${CUST_NOTIFICATION_PATH} | grep -v "\_[0-9]\{3\}\.")
            if [ $? -eq 0 ]; then
                for NOTIFICATION_FILE in ${NOTIFICATION_FILES}; do
                    cp -p ${CUST_NOTIFICATION_PATH}/${NOTIFICATION_FILE} ${USER_NOTIFICATION_PATH}/${NOTIFICATION_FILE}
                done
            fi
        fi
        fi
    fi
    if [ -d ${CUST_ALARM_ALERT_PATH} ]; then
        if [ ! $(ls /cust/${SUBCA_FILE}/config/noalarm.open) ]; then
        CUST_ALARM_ALERT_FILES=$(ls ${CUST_ALARM_ALERT_PATH} | grep ${MCC})
        if [ $? -eq 0 ]; then
            for CUST_ALARM_ALERT_FILE in ${CUST_ALARM_ALERT_FILES}; do
                    ALARM_ALERT_EXTENTION=${CUST_ALARM_ALERT_FILE##*.}
                    ALARM_ALERT_FILE_NAME=${CUST_ALARM_ALERT_FILE%%_${MCC}*}
                    cp -p ${CUST_ALARM_ALERT_PATH}/${CUST_ALARM_ALERT_FILE} ${USER_ALARM_ALERT_PATH}/${ALARM_ALERT_FILE_NAME}.${ALARM_ALERT_EXTENTION}
            done
        else
            ALARM_ALERT_FILES=$(ls ${CUST_ALARM_ALERT_PATH} | grep -v "\_[0-9]\{3\}\.")
            if [ $? -eq 0 ]; then
                for ALARM_ALERT_FILE in ${ALARM_ALERT_FILES}; do
                    cp -p ${CUST_ALARM_ALERT_PATH}/${ALARM_ALERT_FILE} ${USER_ALARM_ALERT_PATH}/${ALARM_ALERT_FILE}
                done
            fi
        fi
        fi
    fi
    IFS=$SAVEIFS
fi

setprop persist.sys.ntcode_list 1

exit 0
