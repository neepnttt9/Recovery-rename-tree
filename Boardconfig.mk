# ========================================
# BoardConfig.mk - m14x (OFRP + AVB Full)
# ========================================

# Inherit from generic
-include device/generic/goldfish/64bit-only/board/*.mk

# Platform
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_BOARD_PLATFORM := [PLATFORM]  # ex: mt6768
TARGET_BOOTLOADER_BOARD_NAME := m14x
TARGET_BOARD_SUFFIX := _64

# Kernel (OFRP)
TARGET_PREBUILT_KERNEL := device/[brand]/m14x/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_TAGS_OFFSET := 0x01000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=qcom \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x01000000 \
    --tags_offset 0x00000100 \
    --header_version 3

# Partitions (AVB + Dynamic)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144

# Super Partition (GSI Ready)
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system system_ext vendor product odm

# AVB 2.0 (OFRP Disable)
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048

# OFRP Recovery Specific
TARGET_RECOVERY_FSTAB := device/[brand]/m14x/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_QCOM_RTC := true

# OFRP Non-Vanilla + AVB
BOARD_HAS_NO_SELECT_BUTTON := true
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_USE_LIBUSB := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_RECRYPT := true
TW_HAS_NO_RECOVERY_PARTITION := false
TW_NO_SCREEN_BLANK := true
TW_DEVICE_VERSION := R12.1

# Screen + Extras
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_LANGUAGE := en
TW_CUSTOM_CPU_GOVERNOR := governor_ondemand
TW_SCREEN_BLANK_ON_BOOT := true

# OFRP Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
