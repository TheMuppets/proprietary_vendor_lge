# Copyright (C) 2011 The CyanogenMod Project
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

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderg/proprietary/lib/hw/gralloc.thunderg.so:system/lib/hw/gralloc.thunderg.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/hw/sensors.thunderg.so:system/lib/hw/sensors.thunderg.so \
    vendor/lge/thunderg/proprietary/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderg/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderg/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderg/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderg/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \

# Wifi
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/thunderg/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/thunderg/proprietary/etc/flex/flex.db:system/etc/flex/flex.db \
    vendor/lge/thunderg/proprietary/etc/flex/flex.xml:system/etc/flex/flex.xml \

# rmt_storage
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/rmt_storage:system/bin/rmt_storage \

# port-bridge
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/port-bridge:system/bin/port-bridge \

# wipeirface
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/tsdown:system/bin/tsdown \
    vendor/lge/thunderg/proprietary/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderg/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderg/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderg/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderg/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderg/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderg/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderg/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderg/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderg/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderg/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderg/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderg/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderg/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderg/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderg/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderg/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderg/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderg/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderg/proprietary/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/thunderg/proprietary/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/thunderg/proprietary/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    vendor/lge/thunderg/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderg/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderg/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderg/proprietary/bin/rild:system/bin/rild \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \
