# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# Audio
BOARD_HAVE_HTC_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := doubleshot

# Kernel [Settings]
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := no_console_suspend=1

# Kernel [Build]
TARGET_KERNEL_CONFIG := doubleshot_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/doubleshot
BUILD_KERNEL := true
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := codefirex-arm-eabi-4.7

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := doubleshot

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true

BOARD_SEPOLICY_DIRS := \
  device/htc/doubleshot/sepolicy

BOARD_SEPOLICY_UNION := \
  file_contexts \
  property_contexts \
  te_macros \
  bluetooth_loader.te \
  bridge.te \
  camera.te \
  conn_init.te \
  device.te \
  dhcp.te \
  domain.te \
  drmserver.te \
  file.te \
  kickstart.te \
  init.te \
  mediaserver.te \
  mpdecision.te \
  netmgrd.te \
  property.te \
  qmux.te \
  restorecon.te \
  rild.te \
  rmt.te \
  sensors.te \
  surfaceflinger.te \
  system.te \
  tee.te \
  thermald.te \
  ueventd.te \
  wpa_supplicant.te

# Wifi
-include device/htc/msm8660-common/bcmdhd.mk

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144

#Recovery
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
#TARGET_RECOVERY_UI_LIB := librecovery_ui_doubleshot
BOARD_HAS_NO_SELECT_BUTTON := false
TARGET_PROVIDES_INIT := true
TARGET_RECOVERY_INITRC := device/htc/doubleshot/recovery/init.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/htc/doubleshot/recovery/default_recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/doubleshot/recovery/graphics.c
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB = device/htc/doubleshot/rootdir/etc/fstab.doubleshot
