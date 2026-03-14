#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    aosp_agassi_mainline:$(LOCAL_DIR)/aosp_agassi_mainline.mk \
    lineage_agassi_mainline:$(LOCAL_DIR)/lineage_agassi_mainline.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += aosp_agassi_mainline-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_agassi_mainline-$(build_type)))
