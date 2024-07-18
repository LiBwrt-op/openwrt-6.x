SUBTARGET:=ipq50xx
BOARDNAME:=Qualcomm Atheros IPQ50xx
DEFAULT_PACKAGES += \
	kmod-gpio-button-hotplug \
	uboot-envtools \
	kmod-qca-nss-dp swconfig \
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci wpad-basic-wolfssl

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ50xx based boards.
endef