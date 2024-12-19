SUBTARGET:=ipq60xx
BOARDNAME:=Qualcomm Atheros IPQ60xx
DEFAULT_PACKAGES += \
	ath11k-firmware-ipq6018 kmod-ath11k-ahb \
	kmod-qca-nss-dp kmod-qca-nss-drv kmod-qca-nss-drv-bridge-mgr \
	kmod-qca-nss-drv-pppoe kmod-qca-nss-drv-vlan-mgr kmod-qca-nss-drv-lag-mgr \
	kmod-qca-nss-ecm kmod-qca-mcs kmod-qca-ssdk nss-firmware-ipq6018

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ60xx based boards.
endef
