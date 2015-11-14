# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/lge/g3-common/setup-makefiles.sh

PRODUCT_COPY_FILES += \
    /proprietary/bin/adsprpcd:system/bin/adsprpcd \
    /proprietary/vendor/lib/libadsprpc.so:system/vendor/lib/libadsprpc.so \
    /proprietary/vendor/lib/libfastcvadsp_stub.so:system/vendor/lib/libfastcvadsp_stub.so \
    /proprietary/vendor/lib/libfastcvopt.so:system/vendor/lib/libfastcvopt.so \
    /proprietary/vendor/lib/libacdbloader.so:system/vendor/lib/libacdbloader.so \
    /proprietary/vendor/lib/libacdbrtac.so:system/vendor/lib/libacdbrtac.so \
    /proprietary/vendor/lib/libadiertac.so:system/vendor/lib/libadiertac.so \
    /proprietary/vendor/lib/libaudcal.so:system/vendor/lib/libaudcal.so \
    /proprietary/etc/acdbdata/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb \
    /proprietary/etc/acdbdata/General_cal.acdb:system/etc/acdbdata/General_cal.acdb \
    /proprietary/etc/acdbdata/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb \
    /proprietary/etc/acdbdata/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb \
    /proprietary/etc/acdbdata/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb \
    /proprietary/etc/acdbdata/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb \
    /proprietary/etc/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb \
    /proprietary/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
    /proprietary/lib/hw/camera.vendor.msm8974.so:system/lib/hw/camera.vendor.msm8974.so \
    /proprietary/lib/libAlAisLib.so:system/lib/libAlAisLib.so \
    /proprietary/lib/libAlAisWrap.so:system/lib/libAlAisWrap.so \
    /proprietary/lib/libAlAisTune.so:system/lib/libAlAisTune.so \
    /proprietary/lib/libalmcascore.so:system/lib/libalmcascore.so \
    /proprietary/lib/libalmcaswrap.so:system/lib/libalmcaswrap.so \
    /proprietary/lib/libHDR.so:system/lib/libHDR.so \
    /proprietary/lib/libmmcamera_interface.so:system/lib/libmmcamera_interface.so \
    /proprietary/lib/libmmjpeg_interface.so:system/lib/libmmjpeg_interface.so \
    /proprietary/lib/libmm-qcamera.so:system/lib/libmm-qcamera.so \
    /proprietary/lib/libmorpho_image_stab31.so:system/lib/libmorpho_image_stab31.so \
    /proprietary/lib/libmorpho_memory_allocator.so:system/lib/libmorpho_memory_allocator.so \
    /proprietary/lib/libmorpho_noise_reduction.so:system/lib/libmorpho_noise_reduction.so \
    /proprietary/lib/libmorpho_panorama_gp.so:system/lib/libmorpho_panorama_gp.so \
    /proprietary/lib/libmorpho_video_denoiser.so:system/lib/libmorpho_video_denoiser.so \
    /proprietary/lib/libqomx_core.so:system/lib/libqomx_core.so \
    /proprietary/vendor/lib/libactuator_dw9714.so:system/vendor/lib/libactuator_dw9714.so \
    /proprietary/vendor/lib/libactuator_dw9714_camcorder.so:system/vendor/lib/libactuator_dw9714_camcorder.so \
    /proprietary/vendor/lib/libactuator_dw9714_camera.so:system/vendor/lib/libactuator_dw9714_camera.so \
    /proprietary/vendor/lib/libjpegdhw.so:system/vendor/lib/libjpegdhw.so \
    /proprietary/vendor/lib/libjpegehw.so:system/vendor/lib/libjpegehw.so \
    /proprietary/vendor/lib/libmmcamera2_c2d_module.so:system/vendor/lib/libmmcamera2_c2d_module.so \
    /proprietary/vendor/lib/libmmcamera2_cpp_module.so:system/vendor/lib/libmmcamera2_cpp_module.so \
    /proprietary/vendor/lib/libmmcamera2_iface_modules.so:system/vendor/lib/libmmcamera2_iface_modules.so \
    /proprietary/vendor/lib/libmmcamera2_imglib_modules.so:system/vendor/lib/libmmcamera2_imglib_modules.so \
    /proprietary/vendor/lib/libmmcamera2_is.so:system/vendor/lib/libmmcamera2_is.so \
    /proprietary/vendor/lib/libmmcamera2_isp_modules.so:system/vendor/lib/libmmcamera2_isp_modules.so \
    /proprietary/vendor/lib/libmmcamera2_pproc_modules.so:system/vendor/lib/libmmcamera2_pproc_modules.so \
    /proprietary/vendor/lib/libmmcamera2_sensor_modules.so:system/vendor/lib/libmmcamera2_sensor_modules.so \
    /proprietary/vendor/lib/libmmcamera2_stats_algorithm.so:system/vendor/lib/libmmcamera2_stats_algorithm.so \
    /proprietary/vendor/lib/libmmcamera2_stats_modules.so:system/vendor/lib/libmmcamera2_stats_modules.so \
    /proprietary/vendor/lib/libmmcamera2_vpe_module.so:system/vendor/lib/libmmcamera2_vpe_module.so \
    /proprietary/vendor/lib/libmmcamera2_wnr_module.so:system/vendor/lib/libmmcamera2_wnr_module.so \
    /proprietary/vendor/lib/libmmcamera_faceproc.so:system/vendor/lib/libmmcamera_faceproc.so \
    /proprietary/vendor/lib/libmmcamera_hdr_gb_lib.so:system/vendor/lib/libmmcamera_hdr_gb_lib.so \
    /proprietary/vendor/lib/libmmcamera_imglib.so:system/vendor/lib/libmmcamera_imglib.so \
    /proprietary/vendor/lib/libmmcamera_imx135.so:system/vendor/lib/libmmcamera_imx135.so \
    /proprietary/vendor/lib/libmmcamera_imx208.so:system/vendor/lib/libmmcamera_imx208.so \
    /proprietary/vendor/lib/libmmcamera_sonyimx135_eeprom.so:system/vendor/lib/libmmcamera_sonyimx135_eeprom.so \
    /proprietary/vendor/lib/libmmcamera_tintless_algo.so:system/vendor/lib/libmmcamera_tintless_algo.so \
    /proprietary/vendor/lib/libmmcamera_tintless_bg_pca_algo.so:system/vendor/lib/libmmcamera_tintless_bg_pca_algo.so \
    /proprietary/vendor/lib/libmmcamera_tuning.so:system/vendor/lib/libmmcamera_tuning.so \
    /proprietary/vendor/lib/libmmcamera_ubifocus_lib.so:system/vendor/lib/libmmcamera_ubifocus_lib.so \
    /proprietary/vendor/lib/libmmipl.so:system/vendor/lib/libmmipl.so \
    /proprietary/vendor/lib/libmmjpeg.so:system/vendor/lib/libmmjpeg.so \
    /proprietary/vendor/lib/libmmqjpeg_codec.so:system/vendor/lib/libmmqjpeg_codec.so \
    /proprietary/vendor/lib/liboemcamera.so:system/vendor/lib/liboemcamera.so \
    /proprietary/vendor/lib/libqomx_jpegenc.so:system/vendor/lib/libqomx_jpegenc.so \
    /proprietary/vendor/lib/libubifocus.so:system/vendor/lib/libubifocus.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_common.so:system/vendor/lib/libchromatix_imx135_30fps_common.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_default_video.so:system/vendor/lib/libchromatix_imx135_30fps_default_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_common.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_common.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_default_video.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_default_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_hfr_120.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_hfr_120.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_hfr_60.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_hfr_60.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_liveshot.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_liveshot.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_mms_video.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_mms_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_preview.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_preview.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_snapshot.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_snapshot.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_uhd_video.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_uhd_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_video_dualrec.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_video_dualrec.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_video_hdr.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_video_hdr.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_video_hd.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_video_hd.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_fuji_video_qtr.so:system/vendor/lib/libchromatix_imx135_30fps_fuji_video_qtr.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_hfr_120.so:system/vendor/lib/libchromatix_imx135_30fps_hfr_120.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_hfr_60.so:system/vendor/lib/libchromatix_imx135_30fps_hfr_60.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_liveshot.so:system/vendor/lib/libchromatix_imx135_30fps_liveshot.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_mms_video.so:system/vendor/lib/libchromatix_imx135_30fps_mms_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_preview.so:system/vendor/lib/libchromatix_imx135_30fps_preview.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_snapshot.so:system/vendor/lib/libchromatix_imx135_30fps_snapshot.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_uhd_video.so:system/vendor/lib/libchromatix_imx135_30fps_uhd_video.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_video_dualrec.so:system/vendor/lib/libchromatix_imx135_30fps_video_dualrec.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_video_hdr.so:system/vendor/lib/libchromatix_imx135_30fps_video_hdr.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_video_hd.so:system/vendor/lib/libchromatix_imx135_30fps_video_hd.so \
    /proprietary/vendor/lib/libchromatix_imx135_30fps_video_qtr.so:system/vendor/lib/libchromatix_imx135_30fps_video_qtr.so \
    /proprietary/vendor/lib/libchromatix_imx208_common.so:system/vendor/lib/libchromatix_imx208_common.so \
    /proprietary/vendor/lib/libchromatix_imx208_default_video.so:system/vendor/lib/libchromatix_imx208_default_video.so \
    /proprietary/vendor/lib/libchromatix_imx208_mms_video.so:system/vendor/lib/libchromatix_imx208_mms_video.so \
    /proprietary/vendor/lib/libchromatix_imx208_preview.so:system/vendor/lib/libchromatix_imx208_preview.so \
    /proprietary/vendor/lib/libchromatix_imx208_vt.so:system/vendor/lib/libchromatix_imx208_vt.so \
    /proprietary/etc/firmware/cpp_firmware_v1_1_1.fw:system/etc/firmware/cpp_firmware_v1_1_1.fw \
    /proprietary/etc/firmware/cpp_firmware_v1_1_6.fw:system/etc/firmware/cpp_firmware_v1_1_6.fw \
    /proprietary/etc/firmware/cpp_firmware_v1_2_0.fw:system/etc/firmware/cpp_firmware_v1_2_0.fw \
    /proprietary/etc/firmware/cpp_firmware_v1_2_1.fw:system/etc/firmware/cpp_firmware_v1_2_1.fw \
    /proprietary/etc/firmware/bu24205_LGIT_rev16_1_2030_data1.bin:system/etc/firmware/bu24205_LGIT_rev16_1_2030_data1.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev16_1_2030_data2.bin:system/etc/firmware/bu24205_LGIT_rev16_1_2030_data2.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev16_1_2030_data3.bin:system/etc/firmware/bu24205_LGIT_rev16_1_2030_data3.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev7_1_data1.bin:system/etc/firmware/bu24205_LGIT_rev7_1_data1.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev7_1_data2.bin:system/etc/firmware/bu24205_LGIT_rev7_1_data2.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev7_1_data3.bin:system/etc/firmware/bu24205_LGIT_rev7_1_data3.bin \
    /proprietary/etc/firmware/bu24205_LGIT_rev9_5M.bin:system/etc/firmware/bu24205_LGIT_rev9_5M.bin \
    /proprietary/etc/firmware/DLdata_rev28B_data1.ecl:system/etc/firmware/DLdata_rev28B_data1.ecl \
    /proprietary/etc/firmware/DLdata_rev28B_data2.ecl:system/etc/firmware/DLdata_rev28B_data2.ecl \
    /proprietary/etc/firmware/DLdata_rev28B_data3.ecl:system/etc/firmware/DLdata_rev28B_data3.ecl \
    /proprietary/bin/qseecomd:system/bin/qseecomd \
    /proprietary/lib/drm/libdrmwvmplugin.so:system/lib/drm/libdrmwvmplugin.so \
    /proprietary/lib/libdrmdiag.so:system/lib/libdrmdiag.so \
    /proprietary/lib/libdrmfs.so:system/lib/libdrmfs.so \
    /proprietary/lib/libdrmtime.so:system/lib/libdrmtime.so \
    /proprietary/lib/libQSEEComAPI.so:system/lib/libQSEEComAPI.so \
    /proprietary/lib/librpmb.so:system/lib/librpmb.so \
    /proprietary/lib/libssd.so:system/lib/libssd.so \
    /proprietary/vendor/lib/libdrmdecrypt.so:system/vendor/lib/libdrmdecrypt.so \
    /proprietary/vendor/lib/liboemcrypto.so:system/vendor/lib/liboemcrypto.so \
    /proprietary/vendor/lib/libwvdrm_L1.so:system/vendor/lib/libwvdrm_L1.so \
    /proprietary/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    /proprietary/vendor/lib/libWVphoneAPI.so:system/vendor/lib/libWVphoneAPI.so \
    /proprietary/vendor/lib/libWVStreamControlAPI_L1.so:system/vendor/lib/libWVStreamControlAPI_L1.so \
    /proprietary/vendor/lib/mediadrm/libdrmclearkeyplugin.so:system/vendor/lib/mediadrm/libdrmclearkeyplugin.so \
    /proprietary/vendor/lib/mediadrm/libwvdrmengine.so:system/vendor/lib/mediadrm/libwvdrmengine.so \
    /proprietary/etc/izat.conf:system/etc/izat.conf \
    /proprietary/etc/permissions/com.qualcomm.location.xml:system/etc/permissions/com.qualcomm.location.xml \
    /proprietary/etc/quipc.conf:system/etc/quipc.conf \
    /proprietary/etc/sap.conf:system/etc/sap.conf \
    /proprietary/etc/xtwifi.conf:system/etc/xtwifi.conf \
    /proprietary/vendor/lib/egl/eglsubAndroid.so:system/vendor/lib/egl/eglsubAndroid.so \
    /proprietary/vendor/lib/egl/libEGL_adreno.so:system/vendor/lib/egl/libEGL_adreno.so \
    /proprietary/vendor/lib/egl/libGLESv1_CM_adreno.so:system/vendor/lib/egl/libGLESv1_CM_adreno.so \
    /proprietary/vendor/lib/egl/libGLESv2_adreno.so:system/vendor/lib/egl/libGLESv2_adreno.so \
    /proprietary/vendor/lib/egl/libq3dtools_adreno.so:system/vendor/lib/egl/libq3dtools_adreno.so \
    /proprietary/vendor/lib/libadreno_utils.so:system/vendor/lib/libadreno_utils.so \
    /proprietary/vendor/lib/libc2d30-a3xx.so:system/vendor/lib/libc2d30-a3xx.so \
    /proprietary/vendor/lib/libC2D2.so:system/vendor/lib/libC2D2.so \
    /proprietary/vendor/lib/libCB.so:system/vendor/lib/libCB.so \
    /proprietary/vendor/lib/libgsl.so:system/vendor/lib/libgsl.so \
    /proprietary/vendor/lib/libllvm-qcom.so:system/vendor/lib/libllvm-qcom.so \
    /proprietary/vendor/lib/libOpenCL.so:system/vendor/lib/libOpenCL.so \
    /proprietary/vendor/lib/librs_adreno_sha1.so:system/vendor/lib/librs_adreno_sha1.so \
    /proprietary/vendor/lib/librs_adreno.so:system/vendor/lib/librs_adreno.so \
    /proprietary/vendor/lib/libRSDriver_adreno.so:system/vendor/lib/libRSDriver_adreno.so \
    /proprietary/vendor/lib/libsc-a3xx.so:system/vendor/lib/libsc-a3xx.so \
    /proprietary/vendor/lib/libscale.so:system/vendor/lib/libscale.so \
    /proprietary/etc/firmware/a330_pfp.fw:system/etc/firmware/a330_pfp.fw \
    /proprietary/etc/firmware/a330_pm4.fw:system/etc/firmware/a330_pm4.fw \
    /proprietary/vendor/lib/libDivxDrm.so:system/vendor/lib/libDivxDrm.so \
    /proprietary/vendor/lib/libExtendedExtractor.so:system/vendor/lib/libExtendedExtractor.so \
    /proprietary/vendor/lib/libI420colorconvert.so:system/vendor/lib/libI420colorconvert.so \
    /proprietary/vendor/lib/libmmosal.so:system/vendor/lib/libmmosal.so \
    /proprietary/vendor/lib/libmmparser.so:system/vendor/lib/libmmparser.so \
    /proprietary/vendor/lib/libmm-color-convertor.so:system/vendor/lib/libmm-color-convertor.so \
    /proprietary/vendor/lib/libOmxAacDec.so:system/vendor/lib/libOmxAacDec.so \
    /proprietary/vendor/lib/libOmxAmrwbplusDec.so:system/vendor/lib/libOmxAmrwbplusDec.so \
    /proprietary/vendor/lib/libOmxEvrcDec.so:system/vendor/lib/libOmxEvrcDec.so \
    /proprietary/vendor/lib/libOmxQcelp13Dec.so:system/vendor/lib/libOmxQcelp13Dec.so \
    /proprietary/vendor/lib/libOmxWmaDec.so:system/vendor/lib/libOmxWmaDec.so \
    /proprietary/bin/mpdecision:system/bin/mpdecision \
    /proprietary/vendor/lib/libqti-perfd-client.so:system/vendor/lib/libqti-perfd-client.so \
    /proprietary/vendor/lib/libdisp-aba.so:system/vendor/lib/libdisp-aba.so \
    /proprietary/vendor/lib/libmm-abl.so:system/vendor/lib/libmm-abl.so \
    /proprietary/vendor/lib/libmm-abl-oem.so:system/vendor/lib/libmm-abl-oem.so \
    /proprietary/bin/irsc_util:system/bin/irsc_util \
    /proprietary/bin/radish:system/bin/radish \
    /proprietary/etc/permissions/qcnvitems.xml:system/etc/permissions/qcnvitems.xml \
    /proprietary/etc/permissions/qcrilhook.xml:system/etc/permissions/qcrilhook.xml \
    /proprietary/vendor/lge/g3-common/proprietary/lib/libcir_driver.so:system/vendor/lge/g3-common/proprietary/lib/libcir_driver.so \
    /proprietary/vendor/lge/g3-common/proprietary/lib/hw/consumerir.msm8974.so:system/vendor/lge/g3-common/proprietary/lib/hw/consumerir.msm8974.so \
    /proprietary/bin/thermal-engine:system/bin/thermal-engine \
    /proprietary/vendor/lib/libthermalclient.so:system/vendor/lib/libthermalclient.so \
    /proprietary/vendor/lib/libthermalioctl.so:system/vendor/lib/libthermalioctl.so \
    /proprietary/bin/time_daemon:system/bin/time_daemon \
    /proprietary/vendor/lib/libTimeService.so:system/vendor/lib/libTimeService.so \
    /proprietary/vendor/firmware/wcnss.b00:system/vendor/firmware/wcnss.b00 \
    /proprietary/vendor/firmware/wcnss.b01:system/vendor/firmware/wcnss.b01 \
    /proprietary/vendor/firmware/wcnss.b02:system/vendor/firmware/wcnss.b02 \
    /proprietary/vendor/firmware/wcnss.b04:system/vendor/firmware/wcnss.b04 \
    /proprietary/vendor/firmware/wcnss.b06:system/vendor/firmware/wcnss.b06 \
    /proprietary/vendor/firmware/wcnss.b07:system/vendor/firmware/wcnss.b07 \
    /proprietary/vendor/firmware/wcnss.b08:system/vendor/firmware/wcnss.b08 \
    /proprietary/vendor/firmware/wcnss.b09:system/vendor/firmware/wcnss.b09 \
    /proprietary/vendor/firmware/wcnss.mdt:system/vendor/firmware/wcnss.mdt
