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


    OPERATOR=`getprop ro.build.target_operator GLOBAL`
    COUNTRY=`getprop ro.build.target_country COM`
    
    if [ $OPERATOR != GLOBAL ]; then
    	CUST=`getprop ro.lge.capp_cupss.rootdir /cust`   #/cust/VDF_COM
      
        #avoid apk overlay model
        if [ "$CUST" != /system/cust ]; then
        
            #avoid single cust model - need to check?
            if [ "$CUST" != /cust ]; then
        	
                NTCODE_LIST=`getprop persist.sys.ntcode "0","XXX,FFF,FFFFFFFF,FFFFFFFF,FF"`
                NTCODE=${NTCODE_LIST#*,}
                NTCODE=${NTCODE:1:3}
    
                mkdir /data/local/etc
                chown system:system /data/local/etc
                chmod 771 /data/local/etc
                restorecon -R /data/local/etc
    
            CONF=$CUST/config/
            OPNAME=${CUST:6}
            PRODUCT=`getprop ro.product.name`
            IS_MULTISIM=`getprop ro.lge.sim_num`        
        
            if [ $IS_MULTISIM == "2" ]; then
                 OPPATH=${OPERATOR}_${COUNTRY}_DS
            elif [ $IS_MULTISIM == "3" ]; then
                 OPPATH=${OPERATOR}_${COUNTRY}_TS
            else
                 OPPATH=${OPERATOR}_${COUNTRY}
            fi        

            CUST_PROPPATH=${CONF}/apps_prop
            if [ "$PRODUCT" == "g3_global_com" -a "$CUST" == "/cust/VDF_COM/CH" ]; then
                PROPPATH=/data/.OP/${OPNAME}/prop
            else
				if [ -d /OP ]; then
                    PROPPATH=/OP/${OPPATH}/prop
				else
					PROPPATH=/data/.OP/${OPPATH}/prop
				fi
            fi
			
            if [ -d /OP ]; then
                APPPATH=/OP/${OPPATH}/apps
            else
                APPPATH=/data/.OP/${OPPATH}/apps
            fi
    
            case "$NTCODE" in 
    	        "XXX")
    	        #Nothing to do - fail to read ntcode
    	        echo "Nothing to do"
    	        ;;
    	        *)
    	           CURRENT=`getprop ro.build.version.incremental 0`
    	           TAG2=`getprop persist.lge.appbox.ntcode 0`
    	           
	           if [ "$TAG2" != "$CURRENT" ]; then 
            
    	               if [ -d ${CUST_PROPPATH}/${NTCODE} ]; then
    	                   for file1 in $(ls -a ${CUST_PROPPATH}/${NTCODE}); do
    	              	    if [ "$file1" != "." -a "$file1" != ".." ]; then
                                   `cat ${CUST_PROPPATH}/${NTCODE}/${file1} > /data/local/etc/${file1}`
                                   chown system:system /data/local/etc/${file1}
                                   chmod 644 /data/local/etc/${file1}
                               fi
                    	done
    	          	    elif [ -d ${CUST_PROPPATH}/FFF ]; then
    	                   for file2 in $(ls -a ${CUST_PROPPATH}/FFF); do
    	              	    if [ "$file2" != "." -a "$file2" != ".." ]; then
                                   `cat ${CUST_PROPPATH}/${NTCODE}/${file2} > /data/local/etc/${file2}`
                                   chown system:system /data/local/etc/${file2}
                                   chmod 644 /data/local/etc/${file2}
                               fi
                           done
    	                elif [ -d ${PROPPATH}/${NTCODE} ]; then
    	                   for file3 in $(ls -a ${PROPPATH}/${NTCODE}); do
    	              	    if [ "$file3" != "." -a "$file3" != ".." ]; then
                                   `cat ${PROPPATH}/${NTCODE}/${file3} > /data/local/etc/${file3}`
                                   chown system:system /data/local/etc/${file3}
                                   chmod 644 /data/local/etc/${file3}
                               fi
                    	   done
    	          	    elif [ -d ${PROPPATH}/FFF ]; then
    	                   for file4 in $(ls -a ${PROPPATH}/FFF); do
    	              	    if [ "$file4" != "." -a "$file4" != ".." ]; then
                                   `cat ${PROPPATH}/${NTCODE}/${file4} > /data/local/etc/${file4}`
                                   chown system:system /data/local/etc/${file4}
                                   chmod 644 /data/local/etc/${file4}
                               fi
                           done
                       fi
            
    	               DATA_SYSTEM=/data/app-system
    	               
                       if [ -f $CONF/ntcode_list_${NTCODE}.cfg ]; then     	       
	                   for apk1 in $(cat $CONF/ntcode_list_${NTCODE}.cfg); do
                               `cat ${APPPATH}/${apk1} > ${DATA_SYSTEM}/${apk1}`
                                   chown system:system ${DATA_SYSTEM}/${apk1}
                                   chmod 644 ${DATA_SYSTEM}/${apk1}
                           done
    	               elif [ -f $CONF/ntcode_list_FFF.cfg ]; then	       
    	                   for apk2 in $(cat $CONF/ntcode_list_FFF.cfg); do
                               `cat ${APPPATH}/${apk2} > ${DATA_SYSTEM}/${apk2}`
                               chown system:system ${DATA_SYSTEM}/${apk2}
                               chmod 644 ${DATA_SYSTEM}/${apk2}
                           done
    	               fi
    	               
    	               #if [ -f /system/etc/errc_list.cfg ]; then     	       
	                   #for module in $(cat /system/etc/errc_list.cfg); do
    	               if [ -f $CONF/errc_list.cfg ]; then     	       
	                   for module in $(cat $CONF/errc_list.cfg); do
                         rm -rf ${DATA_SYSTEM}/${module}
                         rm -rf ${DATA_SYSTEM}/${module}.apk
                         rm -rf ${DATA_SYSTEM}/${module}-*
                         rm -rf ${DATA_SYSTEM}/${module}-*.apk
			 
                         rm -rf /data/app/${module}
                         rm -rf /data/app/${module}.apk
                         rm -rf /data/app/${module}-*
                         rm -rf /data/app/${module}-*.apk
                         			 
                         rm -rf ${APPPATH}/${module}
                         rm -rf ${APPPATH}/${module}.apk
                     done
    	               fi
    	               
    	               setprop persist.lge.appbox.ntcode ${CURRENT}
    	           fi 
    	       ;;
           esac  
       fi    
    fi    
fi        
              
exit 0