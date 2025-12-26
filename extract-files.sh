#!/bin/bash
# ========================================
# extract-files.sh - m14x Proprietary Blobs
# ========================================

# Device configuration
DEVICE=m14x
VENDOR=[brand]  # Replace with realme/samsung/etc

# Helper script path (standard Android structure)
MY_DIR="${BASH_SOURCE%/*}"
HELPER="${MY_DIR}/extract_utils.sh"

# Sanity checks
if [[ ! -d "${MY_DIR}/../${VENDOR}/${DEVICE}" ]]; then
    echo "Error: ${MY_DIR}/../${VENDOR}/${DEVICE} not found"
    exit 1
fi

# Source helper if exists, otherwise basic extraction
if [[ -f "${HELPER}" ]]; then
    source "${HELPER}"
else
    echo "Warning: ${HELPER} not found, using basic extraction"
fi

# Function to extract files from device
function extract() {
    local SRC="$1"
    local DEST="$2"
    mkdir -p "${MY_DIR}/${DEST}"
    
    echo "Extracting ${SRC} → ${DEST}"
    adb pull "${SRC}" "${MY_DIR}/${DEST}/" 2>/dev/null || {
        echo "Failed to pull ${SRC}"
    }
}

# ========================================
# m14x CRITICAL BLOBS EXTRACTION
# ========================================

echo "=== Extracting m14x proprietary files ==="

# Kernel + DTBO (Your files - already have these)
extract "/dev/block/bootdevice/by-name/boot" "prebuilt/boot.img"
extract "/dev/block/bootdevice/by-name/dtbo" "prebuilt/dtbo.img"

# Firmware + Modem
extract "/dev/block/bootdevice/by-name/modem" "modem.img"
extract "/dev/block/bootdevice/by-name/firmware" "firmware/"

# Vendor critical files
extract "/vendor/lib64/hw" "vendor/lib64/hw"
extract "/vendor/lib64/libion.so" "vendor/lib64/"
extract "/vendor/firmware" "vendor/firmware/"

# System blobs
extract "/system/lib64/libGLESv3.so" "system/lib64/"
extract "/system/etc/firmware" "system/etc/"

# DT + Device info
extract "/proc/device-tree/compatible" "compatible.txt"
extract "/proc/cmdline" "cmdline.txt"
extract "/proc/partitions" "partitions.txt"

# ========================================
# GSI/Treble Vendor Blobs
# ========================================
extract "/vendor/etc/vintf/manifest.xml" "vendor/etc/vintf/"
extract "/vendor/odm/etc/vintf/manifest.xml" "vendor/odm/etc/vintf/"

# ========================================
# Recovery + Boot Images (Full dump)
# ========================================
extract "/dev/block/bootdevice/by-name/recovery" "recovery-stock.img"
extract "/dev/block/bootdevice/by-name/vbmeta" "vbmeta.img"
extract "/dev/block/bootdevice/by-name/super" "super.img"

# ========================================
# Partition Table + GPT
# ========================================
extract "/dev/block/mmcblk0" "mmcblk0.img" || echo "Skipping full block dump"

echo "✅ Extraction complete!"
echo "Check proprietary-files.txt for manual verification"

# ========================================
# Usage Instructions
# ========================================
cat << EOF

🚀 NEXT STEPS:
1. Verify extracted files in:
   - prebuilt/ (kernel, dtbo.img)
   - vendor/ (HALs, firmware)
   - proprietary-files.txt

2. Manual copy if needed:
   cp prebuilt/boot.img prebuilt/kernel
   
3. Commit & Build:
   git add .
   git commit -m "m14x: Extract proprietary blobs"
   ./build workflow

EOF
