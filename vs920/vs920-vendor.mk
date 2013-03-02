# Live wallpaper packages
PRODUCT_PACKAGES := \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	VisualizationWallpapers \
	librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

$(call inherit-product, vendor/lge/vs920/vs920-vendor-blobs.mk)
