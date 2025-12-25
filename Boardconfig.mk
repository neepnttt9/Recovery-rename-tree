# ========================================
# NON-VANILLA BoardConfig Additions
# ========================================
# Binary Tools
TW_USE_TOOLBOX := true
TW_USE_LIBUSB := true
TW_INCLUDE_REPACKTOOLS := true

# Non-Vanilla Mounts
TW_FORCE_SYSTEM_MOUNT_RW := true
TW_SYSTEM_PARTITION_RW := true
TW_ALLOW_SYSTEM_ROOTING := true
TW_NO_SYSTEM_RELINK := true

# CRB + Non-Vanilla
TW_INCLUDE_CRB := true
TW_CRB_ENABLED := true
TW_CRB_GSI_SUPPORT := true
TW_CRB_SYSTEM_RW := true

# Non-Vanilla Display
TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 4095
TW_SCREEN_BLANK_ON_BOOT := true
TW_DEVICE_VERSION := R12.1-NV
