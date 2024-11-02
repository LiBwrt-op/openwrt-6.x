define Device/redmi_ax3000
  $(call Device/FitImage)
  $(call Device/UbiFit)
  SOC := ipq5000
  DEVICE_VENDOR := Redmi
  DEVICE_MODEL := AX3000
  DEVICE_ALT0_VENDOR := Xiaomi
  DEVICE_ALT0_MODEL := CR880x
  DEVICE_ALT0_VARIANT := (M81 version)
  DEVICE_ALT1_VENDOR := Xiaomi
  DEVICE_ALT1_MODEL := CR880x
  DEVICE_ALT1_VARIANT := (M79 version)
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  DEVICE_DTS_CONFIG := config@mp02.1
  IMAGES := nand-factory.ubi
  DEVICE_PACKAGES := \
	ath11k-firmware-ipq5018 \
	ath11k-firmware-qcn6122 \
	ipq-wifi-redmi_ax3000
endef
TARGET_DEVICES += redmi_ax3000

