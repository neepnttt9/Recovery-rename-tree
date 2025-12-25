# ========================================
# NON-VANILLA PACKAGES + CRB TOOLS
# ========================================
PRODUCT_PACKAGES += \
    # Non-Vanilla Core
    bash \
    nano \
    tar \
    sed \
    zip \
    unzip \
    digest_cache \
    
    # CRB Tools
    crb_tool \
    crb_flashlight \
    crb_gsi_flasher \
    crb_system_rw \
    crb_avb_bypass \
    
    # ro2rw Tools
    ro2rw \
    system_rw_helper \
    
    # AVB Tools
    magiskboot \
    avb_bypass \
    
    # GSI Tools
    gsi_flasher \
    treble_helper \
    
    # Filesystem Tools
    fsck.exfat \
    fsck.ntfs \
    mkfs.exfat \
    mkfs.ntfs

# Non-Vanilla Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nonvanilla.enabled=true \
    ro.orangefox.nonvanilla=1 \
    persist.sys.nonvanilla=1
