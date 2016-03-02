# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_COPY_FILES += \
    vendor/lge/msm8226-common/proprietary/bin/time_daemon:system/bin/time_daemon \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libacdbrtac.so:system/vendor/lib/libacdbrtac.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libadiertac.so:system/vendor/lib/libadiertac.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libaudcal.so:system/vendor/lib/libaudcal.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/soundfx/libqcbassboost.so:system/vendor/lib/soundfx/libqcbassboost.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/soundfx/libqcreverb.so:system/vendor/lib/soundfx/libqcreverb.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/soundfx/libqcvirt.so:system/vendor/lib/soundfx/libqcvirt.so \
    vendor/lge/msm8226-common/proprietary/bin/irsc_util:system/bin/irsc_util \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libdiag.so:system/vendor/lib/libdiag.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libdsutils.so:system/vendor/lib/libdsutils.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libidl.so:system/vendor/lib/libidl.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqdi.so:system/vendor/lib/libqdi.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqdp.so:system/vendor/lib/libqdp.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqmi_encdec.so:system/vendor/lib/libqmi_encdec.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libsmemlog.so:system/vendor/lib/libsmemlog.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libsystem_health_mon.so:system/vendor/lib/libsystem_health_mon.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqmi_csvt_srvc.so:system/vendor/lib/libqmi_csvt_srvc.so \
    vendor/lge/msm8226-common/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/msm8226-common/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/msm8226-common/proprietary/bin/radish:system/bin/radish \
    vendor/lge/msm8226-common/proprietary/bin/rfs_access:system/bin/rfs_access \
    vendor/lge/msm8226-common/proprietary/bin/rmt_storage:system/bin/rmt_storage \
    vendor/lge/msm8226-common/proprietary/etc/permissions/qcnvitems.xml:system/etc/permissions/qcnvitems.xml \
    vendor/lge/msm8226-common/proprietary/etc/permissions/qcrilhook.xml:system/etc/permissions/qcrilhook.xml \
    vendor/lge/msm8226-common/proprietary/framework/qcnvitems.jar:system/framework/qcnvitems.jar \
    vendor/lge/msm8226-common/proprietary/framework/qcrilhook.jar:system/framework/qcrilhook.jar \
    vendor/lge/msm8226-common/proprietary/framework/qti-telephony-common.jar:system/framework/qti-telephony-common.jar \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libconfigdb.so:system/vendor/lib/libconfigdb.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/liblqe.so:system/vendor/lib/liblqe.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libnetmgr.so:system/vendor/lib/libnetmgr.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libril-qc-qmi-1.so:system/vendor/lib/libril-qc-qmi-1.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libril-qcril-hook-oem.so:system/vendor/lib/libril-qcril-hook-oem.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libxml.so:system/vendor/lib/libxml.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqmi_client_helper.so:system/vendor/lib/libqmi_client_helper.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/egl/eglsubAndroid.so:system/vendor/lib/egl/eglsubAndroid.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/egl/libEGL_adreno.so:system/vendor/lib/egl/libEGL_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/egl/libGLESv1_CM_adreno.so:system/vendor/lib/egl/libGLESv1_CM_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/egl/libGLESv2_adreno.so:system/vendor/lib/egl/libGLESv2_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/egl/libq3dtools_adreno.so:system/vendor/lib/egl/libq3dtools_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libadreno_utils.so:system/vendor/lib/libadreno_utils.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libbccQTI.so:system/vendor/lib/libbccQTI.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libC2D2.so:system/vendor/lib/libC2D2.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libCB.so:system/vendor/lib/libCB.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libc2d30-a3xx.so:system/vendor/lib/libc2d30-a3xx.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libgsl.so:system/vendor/lib/libgsl.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libllvm-qcom.so:system/vendor/lib/libllvm-qcom.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libOpenCL.so:system/vendor/lib/libOpenCL.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libsc-a3xx.so:system/vendor/lib/libsc-a3xx.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libRSDriver_adreno.so:system/vendor/lib/libRSDriver_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/librs_adreno.so:system/vendor/lib/librs_adreno.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/librs_adreno_sha1.so:system/vendor/lib/librs_adreno_sha1.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libscale.so:system/vendor/lib/libscale.so \
    vendor/lge/msm8226-common/proprietary/bin/qseecomd:system/bin/qseecomd \
    vendor/lge/msm8226-common/proprietary/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/lge/msm8226-common/proprietary/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libQSEEComAPI.so:system/vendor/lib/libQSEEComAPI.so \
    vendor/lge/msm8226-common/proprietary/lib/libdrmdecrypt.so:system/lib/libdrmdecrypt.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libdrmdiag.so:system/vendor/lib/libdrmdiag.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libdrmfs.so:system/vendor/lib/libdrmfs.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libdrmtime.so:system/vendor/lib/libdrmtime.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/librpmb.so:system/vendor/lib/librpmb.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libssd.so:system/vendor/lib/libssd.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libwvdrm_L3.so:system/vendor/lib/libwvdrm_L3.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libWVStreamControlAPI_L3.so:system/vendor/lib/libWVStreamControlAPI_L3.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/drm/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \
    vendor/lge/msm8226-common/proprietary/lib/libqomx_core.so:system/lib/libqomx_core.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libI420colorconvert.so:system/vendor/lib/libI420colorconvert.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libmm-color-convertor.so:system/vendor/lib/libmm-color-convertor.so \
    vendor/lge/msm8226-common/proprietary/bin/adsprpcd:system/bin/adsprpcd \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libadsprpc.so:system/vendor/lib/libadsprpc.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libfastcvadsp_stub.so:system/vendor/lib/libfastcvadsp_stub.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libfastcvopt.so:system/vendor/lib/libfastcvopt.so \
    vendor/lge/msm8226-common/proprietary/vendor/bin/thermal-engine:system/vendor/bin/thermal-engine \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libthermalioctl.so:system/vendor/lib/libthermalioctl.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libthermalclient.so:system/vendor/lib/libthermalclient.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/liblistenhardware.so:system/vendor/lib/liblistenhardware.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/liblistenjni.so:system/vendor/lib/liblistenjni.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/liblistensoundmodel.so:system/vendor/lib/liblistensoundmodel.so \
    vendor/lge/msm8226-common/proprietary/lib/libloc_api_v02.so:system/lib/libloc_api_v02.so \
    vendor/lge/msm8226-common/proprietary/lib/libloc_ds_api.so:system/lib/libloc_ds_api.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/hw/flp.default.so:system/vendor/lib/hw/flp.default.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libgeofence.so:system/vendor/lib/libgeofence.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libizat_core.so:system/vendor/lib/libizat_core.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/liblbs_core.so:system/vendor/lib/liblbs_core.so \
    vendor/lge/msm8226-common/proprietary/bin/mpdecision:system/bin/mpdecision \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqti-perfd-client.so:system/vendor/lib/libqti-perfd-client.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libqc-opt.so:system/vendor/lib/libqc-opt.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libDivxDrm.so:system/vendor/lib/libDivxDrm.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libmmosal.so:system/vendor/lib/libmmosal.so \
    vendor/lge/msm8226-common/proprietary/vendor/lib/libSHIMDivxDrm.so:system/vendor/lib/libSHIMDivxDrm.so
