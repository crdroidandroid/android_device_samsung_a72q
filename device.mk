#
# Copyright (C) 2021 The LineageOS Project
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
#

DEVICE_PATH := device/samsung/a72q

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# call the common setup
$(call inherit-product, device/samsung/sm7125-common/common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/a72q/a72q-vendor.mk)

# Init files
PRODUCT_PACKAGES += \
    init.a72q.rc

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera firmware symlinks
 PRODUCT_PACKAGES += \
    com.samsung.sensormodule.0_0_sony_imx682.bin_symlink \
    com.samsung.sensormodule.0_2_sony_dv_imx682_hw_2.bin_symlink \
    com.samsung.sensormodule.0_3_lsi_dv_s5kgw1p_hw_2.bin_symlink \
    com.samsung.sensormodule.0_3_lsi_dv_s5kgw1p_hw_2_otp.bin_symlink \
    com.samsung.sensormodule.3_0_hynix_hi847.bin_symlink \
    com.samsung.sensormodule.3_1_hynix_dv_hi847_hw_2.bin_symlink \
    com.samsung.sensormodule.4_lsi_gc5035_macro.bin_symlink \
    com.samsung.tuned.hynix_hi1336.bin_symlink \
    com.samsung.tuned.hynix_hi847.bin_symlink \
    com.samsung.tuned.lsi_s5k3l6.bin_symlink \
    com.samsung.tuned.lsi_s5kgw1p.bin_symlink \
    com.samsung.tuned.sony_imx682.bin_symlink

 # Soong namespaces
 PRODUCT_SOONG_NAMESPACES += \
     $(DEVICE_PATH)

#UDFPS Customization
TARGET_HAS_UDFPS := true

#Sign it
-include vendor/lineage-priv/keys/keys.mk
