include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=qualcommax
BOARDNAME:=Qualcomm Atheros 802.11ax WiSoC-s
FEATURES:=squashfs ramdisk fpu nand rtc emmc
KERNELNAME:=Image
CPU_TYPE:=cortex-a53
SUBTARGETS:=ipq807x ipq60xx

KERNEL_PATCHVER:=6.6

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-usb3 kmod-usb-dwc3 kmod-usb-dwc3-qcom \
	kmod-leds-gpio kmod-gpio-button-hotplug \
	kmod-qca-nss-dp kmod-ath11k-ahb \
	wpad-openssl uboot-envtools \
	e2fsprogs kmod-fs-ext4 losetup \
	nss-firmware-ipq6018 kmod-qca-nss-drv-bridge-mgr kmod-qca-nss-drv-clmapmgr kmod-qca-nss-drv-eogremgr kmod-qca-nss-drv-gre \
	kmod-qca-nss-drv-igs kmod-qca-nss-drv-l2tpv2 kmod-qca-nss-drv-lag-mgr kmod-qca-nss-drv-map-t kmod-qca-mcs kmod-qca-nss-ecm \
	kmod-qca-nss-drv-match kmod-qca-nss-drv-mirror kmod-qca-nss-drv-pppoe kmod-qca-nss-drv-pptp kmod-qca-nss-drv-pvxlanmgr kmod-qca-nss-drv-qdisc \
	kmod-qca-nss-drv-tun6rd kmod-qca-nss-drv-tunipip6 kmod-qca-nss-drv-vlan-mgr kmod-qca-nss-drv-vxlanmgr kmod-qca-nss-macsec\

$(eval $(call BuildTarget))
