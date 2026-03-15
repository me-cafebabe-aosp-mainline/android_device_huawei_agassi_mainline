#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_HUAWEI_AGASSI := true

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/BoardConfigMainlineQcomCommon.mk

# A/B
AB_OTA_UPDATER := false

# Bootloader
BOARD_BOOT_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_LK2ND_MAKE_FLAGS := \
    LK2ND_ADTBS=msm8917-huawei-agassi.dtb \
    LK2ND_COMPATIBLE=huawei,agassi \
    OSVERSION_IN_BOOTIMAGE=1

# Boot parameters
BOARD_KERNEL_CMDLINE := \
    $(MAINLINE_COMMON_ANDROIDBOOT_PARAMS) \
    $(MAINLINE_COMMON_KERNEL_PARAMS) \
    $(MAINLINE_QCOM_KERNEL_PARAMS) \
    $(MAINLINE_QCOM_SOC_ANDROIDBOOT_PARAMS) \
    androidboot.hardware=agassi \
    androidboot.verifiedbootstate=orange \
    console=tty0 \
    lk2nd.pass-ramoops=zap

BOARD_KERNEL_CMDLINE += \
    androidboot.selinux=permissive \
    audit=0

# Display
TARGET_SCREEN_DENSITY := 160

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_SOURCE := kernel/mainline/msm89x7-mainline

TARGET_DTB_LIST_WILDCARD := \
    qcom/msm8917-huawei-agassi \

TARGET_KERNEL_CONFIG_EXT := \
    $(DEVICE_PATH)/kconfigs/config-postmarketos-qcom-msm89x7.aarch64 \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/b/android-6.12/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.include_dep.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.include_dep.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.include_dep.touchscreen)) \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

# OTA
TARGET_OTA_ASSERT_DEVICE := agassi,agassi_mainline

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 83886080
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 83886080
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_SIZE := 771751936
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Ramdisk
BOARD_RAMDISK_USE_LZ4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab/fstab.agassi

# SELinux
BOARD_ODM_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/odm

# VINTF
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/vintf/manifest.xml
