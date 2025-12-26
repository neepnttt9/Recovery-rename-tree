# ========================================
# omni_m14x.mk - GSI/Treble Base for m14x
# ========================================

# Inherit from core 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# GSI/Treble Common
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/treble_common_64.mk)

# OrangeFox Common (for recovery build)
$(call inherit-product, vendor/orangefox/common/common.mk)

# Device identifier (GSI Base)
PRODUCT_DEVICE := m14x
PRODUCT_NAME := omni_m14x
PRODUCT_BRAND := generic
PRODUCT_SYSTEM_BRAND := [BRAND]
PRODUCT_SYSTEM_MANUFACTURER := [MANUFACTURER]
PRODUCT_MODEL := [MODEL_NAME]
PRODUCT_MANUFACTURER := [MANUFACTURER]

PRODUCT_RELEASE_NAME := m14x
PRODUCT_SYSTEM_DEVICE := m14x

# GSI/Treble Properties (A-Only Optimized)
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=omni_m14x \
    TARGET_DEVICE=m14x \
    PRIVATE_BUILD_DESC="m14x-user 12 SP1A.210812.016 123456 release-keys" \
    BUILD_FINGERPRINT="google/sunfish/sunfish:11/RQ3A.210905.001/123456:user/release-keys"

# Project Treble Essential
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    ro.treble.tracing.enabled=true \
    ro.treble.vintf.concurrency=true \
    ro.treble.debugging.enabled=true \
    persist.treble.isolated.de=true \
    persist.treble.sysprop=true \
    ro.vndk.lite=true \
    ro.boot.vbmeta.device_state=orange \
    ro.system.build.date=2025-12-26 \
    ro.system.build.date.utc=1735155200 \
    ro.system.build.id=TQ2B.230505.005.A1 \
    ro.system.build.version.incremental=123456 \
    ro.system.build.version.release=12 \
    ro.system.build.version.release_or_codename=12 \
    ro.system.build.version.sdk=32 \
    ro.product.first_api_level=30 \
    ro.system.product.manufacturer=[MANUFACTURER] \
    ro.system.product.brand=[BRAND] \
    ro.system.product.device=m14x \
    ro.system.product.model=[MODEL_NAME] \
    ro.system.product.name=omni_m14x \
    ro.product.device=m14x \
    ro.product.name=omni_m14x \
    ro.product.manufacturer=[MANUFACTURER] \
    ro.product.brand=generic \
    ro.product.model=[MODEL_NAME] \
    ro.product.device=m14x

# VNDK + Treble Support
PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_EXTRA_VNDK_VERSIONS += 32 31 30 29 28
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic Partitions (Super GSI)
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# A/B + GSI Partitions
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# GSI Applications (Treble Test)
PRODUCT_GSI_APPLICATIONS := \
    treble_app \
    treble_app2

# DTBO + Kernel Support (Your Files)
PRODUCT_COPY_FILES += \
    device/[brand]/m14x/prebuilt/kernel:kernel \
    device/[brand]/m14x/prebuilt/dtbo/dtbo.img:dtbo.img

# OrangeFox Recovery Packages
PRODUCT_PACKAGES += \
    recovery \
    init_recovery \
    bootctrl.m14x \
    bootctrl.m14x.recovery \
    libgptutils \
    libz \
    libcutils \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service

# Non-Vanilla + CRB Tools
PRODUCT_PACKAGES += \
    bash \
    nano \
    tar \
    crb_tool \
    crb_gsi_flasher \
    ro2rw \
    magiskboot

# Filesystem Tools (GSI)
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mkfs.exfat \
    mkfs.ntfs

# Treble Vendor Interface
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.m14x \
    android.hardware.audio.service \
    android.hardware.graphics.mapper@4.0-service

# GSI Build Flags
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# SELinux permissive for recovery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive \
    androidboot.selinux=permissive
