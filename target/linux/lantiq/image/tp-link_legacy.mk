DEVICE_VARS += TPLINK_FLASHLAYOUT TPLINK_HWID TPLINK_HWREV TPLINK_HWREVADD TPLINK_HVERSION

define Device/dsa-migration
  DEVICE_COMPAT_VERSION := 1.1
  DEVICE_COMPAT_MESSAGE := Config cannot be migrated from swconfig to DSA
endef

define Device/lantiqTpLink
  DEVICE_VENDOR := TP-Link
  TPLINK_HWREVADD := 0
  TPLINK_HVERSION := 2
  KERNEL := kernel-bin | append-dtb | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | \
	tplink-v2-header -s -V "ver. 1.0"
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := tplink-v2-image -s -V "ver. 1.0" | \
	check-size | append-metadata
endef

define Device/tplink_tdw8970
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_MODEL := TD-W8970
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 8Mltq
  TPLINK_HWID := 0x89700001
  TPLINK_HWREV := 1
  IMAGE_SIZE := 7680k
  DEVICE_PACKAGES:= kmod-ath9k wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += TDW8970
endef
TARGET_DEVICES += tplink_tdw8970

define Device/tplink_tdw8980
  $(Device/dsa-migration)
  $(Device/lantiqTpLink)
  DEVICE_MODEL := TD-W8980
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 8Mltq
  TPLINK_HWID := 0x89800001
  TPLINK_HWREV := 14
  IMAGE_SIZE := 7680k
  DEVICE_PACKAGES:= kmod-ath9k kmod-owl-loader wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += TDW8980
endef
TARGET_DEVICES += tplink_tdw8980
