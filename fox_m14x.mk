## OrangeFox specific properties
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# AVB Disable (OFRP Addon)
PRODUCT_ODM_DISABLE_FBE_DECRYPTION := true
PRODUCT_PACKAGES += \
    disable_dm-verity \
    disable-verification

# OFRP Extras
PRODUCT_PACKAGES += \
    OrangeFox \
    charger_res_images \
    charger \
    libinit_m14x \
    fsck.exfat \
    fsck.ntfs

# GApps compatibility
PRODUCT_PACKAGES += \
    libion \
    libGLESv3 \
    ionalloc \
    ashmemdll \
    android.hardware.thermal@2.0-service.m14x
