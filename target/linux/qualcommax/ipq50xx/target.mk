SUBTARGET:=ipq50xx
BOARDNAME:=Qualcomm Atheros IPQ50xx
DEFAULT_PACKAGES += \
	kmod-gpio-button-hotplug \
	uboot-envtools \
	kmod-qca-nss-dp kmod-qca-nss-drv kmod-qca-mcs kmod-qca-nss-ecm\
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci wpad-basic-wolfssl \
	ath11k-firmware-ipq5018 nss-firmware-ipq5018

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ50xx based boards.
endef
