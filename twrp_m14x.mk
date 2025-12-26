$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device identifier
PRODUCT_DEVICE := m14x
PRODUCT_NAME := twrp_m14x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy M14 5G
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := m14x

# Dynamic Partitions + AVB (Previous flags)
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe_v2 \
    android.hardware.boot@1.1-impl.recovery \
    bootctrl.m14x \
    bootctrl.m14x.recovery

# CRB (Custom Recovery Boot) - Prevents stock recovery restore
PRODUCT_PACKAGES += \
    otapreopt_image \
    crb

# Treble GSI Support (Comfortable)
PRODUCT_PACKAGES += \
    treble_overlay_mod \
    vendor.treble.overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    persist.treble.overlay.enable=true \
    ro.treble.traced.enable=true

# ro2rw Support (System RO->RW after format)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.state=unencrypted \
    ro.boot.vbmeta.device_state=orange \
    ro.boot.verifiedbootstate=orange \
    ro.boot.veritymode=enforcing \
    ro.recovery.verity=disabled \
    ro.frp.mode=1 \
    persist.vendor.recovery_update=true

# Build props
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="m14x-user 13 SP1A.210812.016 release-keys" \
    TARGET_DEVICE=m14x \
    TARGET_PRODUCT=twrp_m14x

# TWRP Platform
TARGET_RECOVERY_FSTAB := device/samsung/m14x/recovery/rootdir/etc/recovery.fstab
TW_USE_FSCRYPT_POLICY_DEFAULT := true
TW_INCLUDE_CRYPTO := true
TW_DEVICE_VERSION := 3
