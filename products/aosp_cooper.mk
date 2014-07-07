# Copyright (C) 2014 Olivier K.
# Contains modifications by zst123, Copyright (C) 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Check for target product
ifneq ($(filter cm_cooper aosp_cooper,$(TARGET_PRODUCT)),)

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := aosp_mdpi

# Inherit telephony common stuff
$(call inherit-product, vendor/aosp/configs/telephony.mk)

# Include main configuration
include vendor/aosp/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/cooper/full_cooper.mk)

# Override AOSP build props
PRODUCT_NAME := aosp_cooper
PRODUCT_DEVICE := cooper
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-S5830
PRODUCT_MANUFACTURER := Samsung

# Boot Animation
PRODUCT_COPY_FILES += \
        vendor/aosp/prebuilt/bootanimation/mdpi.zip:system/media/bootanimation.zip

## Assign the build fingerprint to the build.prop file.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/aosp_cooper/cooper:4.4.2/$(BUILD_ID)/user/release-keys

endif
