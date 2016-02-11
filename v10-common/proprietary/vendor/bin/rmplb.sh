#!/system/bin/sh

parallel_threads=`getprop ro.lge.parallel.threads`
cache_dir=code_cache/com.lge.parallel_loading

if [ "${parallel_threads}" != "" ]
then
    for pkg in `ls /data/data/`
    do
        if [ -d "/data/data/${pkg}/${cache_dir}" ]
        then
            rm -rf /data/data/${pkg}/${cache_dir}/*
        fi
    done

    if [ -d "/data/system/${cache_dir}" ]
    then
        rm -rf /data/system/${cache_dir}/*
    fi
fi
