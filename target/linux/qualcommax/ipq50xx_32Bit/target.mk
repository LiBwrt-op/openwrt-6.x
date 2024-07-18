SUBTARGET:=ipq50xx_32Bit
BOARDNAME:=Qualcomm Atheros IPQ50xx_32Bit
ARCH:=arm
CPU_TYPE:=cortex-a7
CPU_SUBTYPE:=neon-vfpv4
DEFAULT_PACKAGES += \
	kmod-gpio-button-hotplug \
	uboot-envtools \
	kmod-qca-nss-dp swconfig \
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci wpad-basic-wolfssl

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ50xx 32Bit based boards.
endef