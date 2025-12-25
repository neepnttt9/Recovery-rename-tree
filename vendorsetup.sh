#!/bin/bash
# ========================================
# m14x - FULL NON-VANILLA + CRB + GSI + ro2rw + AVB
# ========================================

# ========================================
# NON-VANILLA CORE (25+ Features)
# ========================================
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_DIGEST_CACHE=1
export FOX_DISABLE_APP_MANAGER=1
export OF_NO_TWRP_FOLDER=1
export OF_NO_MIUI_PATCH=1

# ========================================
# GSI + A-Only Super Partition
# ========================================
export OF_SUPPORT_GSI=1
export FOX_SUPPORT_GSI=1
export OF_USE_GSI_PARTITION=1
export FOX_DYNAMIC_PARTITION=1
export BOARD_BUILD_SYSTEM_ROOT_IMAGE_PARTITION_A=1
export FOX_PARTITION_SIZE_SYSTEM=67108864
export FOX_PARTITION_SIZE_VENDOR=50331648
export OF_FLASH_ALL_PARTITIONS=1
export OF_UNION_SYSTEM=1

# ========================================
# FULL AVB 2.0 BYPASS
# ========================================
export OF_PATCH_AVB20=1
export OF_SUPPORT_VBMETA_AVB2_PATCHING=1
export OF_DISABLE_AVBMETA=1
export OF_VBMETA_DISABLE_FLAGS=1
export OF_FLASH_VBMETA_SYSTEM=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_DONT_PATCH_ENCRYPTED_DEVICES=1
export OF_NO_RECRYPT=1
export FOX_OWE_DISABLED=1
export OF_RECOVERY_LP_MODE=1
export OF_DISABLE_DM_VERITY_INDICATOR=1

# ========================================
# ro2rw + SYSTEM ERASE
# ========================================
export FOX_ENABLE_RO2RW=1
export OF_RO2RW=1
export FOX_FORCE_RO2RW=1
export FOX_ENABLE_SYSTEM_ERASE=1
export OF_SYSTEM_ERASE_AFTER_RO2RW=1
export FOX_WIPE_SYSTEM_AFTER_RO2RW=1
export FOX_REVERT_RO2RW_ON_WIPE=1
export FOX_MOUNT_SYSTEM_RW=1

# ========================================
# CRB TOOL SUITE
# ========================================
export FOX_USE_CRB=1
export OF_USE_CRB_TOOL=1
export FOX_CRB_TOOL_ENABLED=1
export FOX_CRB_MIUI_OPTIMIZATIONS=1
export FOX_CRB_DYNAMIC_PARTITION_SUPPORT=1
export FOX_CRB_GSI_FLASHING=1
export FOX_CRB_SYSTEM_RW_SUPPORT=1
export FOX_CRB_AVB_BYPASS=1

# ========================================
# FBE + ENCRYPTION BYPASS
# ========================================
export OF_SUPPORT_FBE_OS=1
export TW_INCLUDE_FBE_METADATA_DECRYPT=1

# ========================================
# UI + MESSAGES
# ========================================
export FOX_WARNING_MESSAGE_BOOT="Use volume keys to select package(s) and swipe to flash"
export FOX_WARNING_MESSAGE_WIPE="/sdcard/"
export FOX_WARNING_MESSAGE_MOUNT="/sdcard/"
export TW_THEME="portrait_hdpi"
export TW_EXTRA_LANGUAGES=true

echo "✅ FULL NON-VANILLA (35+ flags) + CRB + GSI + ro2rw enabled!"
