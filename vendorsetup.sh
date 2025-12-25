#!/bin/bash
# ========================================
# OFRP m14x - Full AVB + Non-Vanilla
# ========================================

# AVB 2.0 Full Disable
export OF_PATCH_AVB20=1
export OF_SUPPORT_VBMETA_AVB2_PATCHING=1
export OF_DISABLE_AVBMETA=1
export OF_VBMETA_DISABLE_FLAGS=1
export OF_FLASH_VBMETA_SYSTEM=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

# Essential Bypass
export OF_DONT_PATCH_ENCRYPTED_DEVICES=1
export OF_NO_RECRYPT=1
export FOX_OWE_DISABLED=1
export OF_RECOVERY_LP_MODE=1
export OF_DISABLE_DM_VERITY_INDICATOR=1

# Non-Vanilla OFRP
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export OF_SUPPORT_FBE_OS=1
export OF_NO_MIUI_PATCH=1
export FOX_DYNAMIC_PARTITION=1
export OF_SUPPORT_GSI=1
