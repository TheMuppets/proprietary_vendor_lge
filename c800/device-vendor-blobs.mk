# Copyright (C) 2010 The Android Open Source Project
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

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \
    vendor/lge/c800/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    vendor/lge/c800/proprietary/lib/libcamera_client.so:obj/lib/libcamera_client.so \
    vendor/lge/c800/proprietary/lib/libv8.so:obj/lib/libv8.so

# All the blobs necessary for c800
PRODUCT_COPY_FILES += \
    vendor/lge/c800/proprietary/bin/ami304d:system/bin/ami304d \
    vendor/lge/c800/proprietary/bin/immvibed:system/bin/immvibed \
    vendor/lge/c800/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/c800/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/c800/proprietary/bin/rild:system/bin/rild \
    vendor/lge/c800/proprietary/bin/rmt_storage:system/bin/rmt_storage \
    vendor/lge/c800/proprietary/etc/firmware/BCM4330B1_002.001.003.0243.0305.hcd:system/etc/firmware/BCM4330B1_002.001.003.0243.0305.hcd \
    vendor/lge/c800/proprietary/etc/firmware/rtecdc-apsta.bin:system/etc/firmware/rtecdc-apsta.bin \
    vendor/lge/c800/proprietary/etc/firmware/rtecdc.bin:system/etc/firmware/rtecdc.bin \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    vendor/lge/c800/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/c800/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/lge/c800/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/c800/proprietary/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    vendor/lge/c800/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/c800/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/c800/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/c800/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/c800/proprietary/lib/hw/camera.lgc800.so:system/lib/hw/camera.lgc800.so \
    vendor/lge/c800/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/lge/c800/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/c800/proprietary/lib/libOpenVG.so:system/lib/libOpenVG.so \
    vendor/lge/c800/proprietary/lib/libC2D2.so:system/lib/libC2D2.so \
    vendor/lge/c800/proprietary/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    vendor/lge/c800/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/lge/c800/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/c800/proprietary/lib/libchromatix_mt9p017_ar.so:system/lib/libchromatix_mt9p017_ar.so \
    vendor/lge/c800/proprietary/lib/libchromatix_mt9p017_default_video.so:system/lib/libchromatix_mt9p017_default_video.so \
    vendor/lge/c800/proprietary/lib/libchromatix_mt9p017_preview.so:system/lib/libchromatix_mt9p017_preview.so \
    vendor/lge/c800/proprietary/lib/libgemini.so:system/lib/libgemini.so \
    vendor/lge/c800/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/c800/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/lge/c800/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    vendor/lge/c800/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/c800/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/c800/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/c800/proprietary/lib/libcne.so:system/lib/libcne.so \
    vendor/lge/c800/proprietary/lib/libcneutils.so:system/lib/libcneutils.so \
    vendor/lge/c800/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/c800/proprietary/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so  \
    vendor/lge/c800/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/c800/proprietary/lib/libdsucsd.so:system/lib/libdsucsd.so \
    vendor/lge/c800/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/c800/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/c800/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/c800/proprietary/lib/libidl.so:system/lib/libidl.so \
    vendor/lge/c800/proprietary/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/c800/proprietary/lib/liblge_security.so:system/lib/liblge_security.so \
    vendor/lge/c800/proprietary/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/c800/proprietary/lib/liblgenfctest.so:system/lib/liblgenfctest.so \
    vendor/lge/c800/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/c800/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/c800/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so \
    vendor/lge/c800/proprietary/lib/libnfc.so:system/lib/libnfc.so \
    vendor/lge/c800/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/c800/proprietary/lib/libnv.so:obj/lib/libnv.so \
    vendor/lge/c800/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/c800/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/c800/proprietary/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    vendor/lge/c800/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/c800/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/c800/proprietary/lib/libqdp.so:system/lib/libqdp.so \
    vendor/lge/c800/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/c800/proprietary/lib/librefcne.so:system/lib/librefcne.so \
    vendor/lge/c800/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/lge/c800/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/c800/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/c800/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/c800/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/c800/proprietary/lib/libv8.so:system/lib/libv8.so 
