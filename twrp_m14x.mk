$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# OrangeFox
$(call inherit-product, vendor/orangefox/common/common.mk)

# Device identifier
PRODUCT_DEVICE := m14x
PRODUCT_NAME := twrp_m14x
PRODUCT_BRAND := [BRAND]
PRODUCT_MODEL := [MODEL_NAME]
PRODUCT_MANUFACTURER := [MANUFACTURER]
PRODUCT_RELEASE_NAME := m14x

# AVB + OFRP Properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="m14x-user 12 SP1A.210812.016 release-keys" \
    TARGET_DEVICE=m14x \
    TARGET_PRODUCT=twrp_m14x

# OFRP Addon Flags
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    persist.vendor.recovery_update=true \
    ro.boot.recovery_update=true
