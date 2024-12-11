SUBTARGET:=ipq60xx
BOARDNAME:=Qualcomm Atheros IPQ60xx
DEFAULT_PACKAGES += \
	ath11k-firmware-ipq6018 nss-firmware-ipq6018 kmod-qca-nss-dp kmod-ath11k-ahb \
	kmod-qca-nss-drv kmod-qca-nss-ecm \
	kmod-qca-nss-drv-bridge-mgr

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ60xx based boards.
endef
