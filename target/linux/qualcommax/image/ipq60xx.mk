define Device/8devices_mango-dvk
	$(call Device/FitImageLzma)
	DEVICE_VENDOR := 8devices
	DEVICE_MODEL := Mango-DVK
	IMAGE_SIZE := 27776k
	BLOCKSIZE := 64k
	SOC := ipq6010
	SUPPORTED_DEVICES += 8devices,mango
	IMAGE/sysupgrade.bin := append-kernel | pad-to 64k | append-rootfs | pad-rootfs | check-size | append-metadata
	DEVICE_PACKAGES := ipq-wifi-8devices_mango
endef
TARGET_DEVICES += 8devices_mango-dvk

define Device/EmmcImage
	IMAGES += factory.bin sysupgrade.bin
	IMAGE/factory.bin := append-rootfs | pad-rootfs | pad-to 64k
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to 64k | sysupgrade-tar rootfs=$$$$@ | append-metadata
endef

define Device/glinet_gl-ax1800
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := GL-iNet
	DEVICE_MODEL := GL-AX1800
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-glinet_gl-ax1800 e2fsprogs dosfstools kmod-fs-ext4 kmod-fs-ntfs kmod-fs-vfat \
		kmod-fs-exfat block-mount kmod-usb-storage kmod-usb2 fdisk
endef
TARGET_DEVICES += glinet_gl-ax1800

define Device/glinet_gl-axt1800
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := GL-iNet
	DEVICE_MODEL := GL-AXT1800
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-glinet_gl-axt1800 kmod-hwmon-core e2fsprogs dosfstools kmod-fs-ext4 kmod-fs-ntfs kmod-fs-vfat \
		kmod-fs-exfat kmod-hwmon-pwmfan block-mount kmod-usb-storage kmod-usb2 fdisk
endef
TARGET_DEVICES += glinet_gl-axt1800

define Device/jdc_ax1800-pro
	$(call Device/FitImage)
	DEVICE_VENDOR := JD Cloud
	DEVICE_MODEL := JDC AX1800 Pro
	DEVICE_DTS_CONFIG := config@cp03-c2
	DEVICE_DTS := ipq6018-jdc-ax1800-pro
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-jdc_ax1800-pro kmod-fs-ext4 mkf2fs f2fsck kmod-fs-f2fs
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to 6144k |  append-rootfs | append-metadata
endef
TARGET_DEVICES += jdc_ax1800-pro

define Device/netgear_wax214
       $(call Device/FitImage)
       $(call Device/UbiFit)
       DEVICE_VENDOR := Netgear
       DEVICE_MODEL := WAX214
       BLOCKSIZE := 128k
       PAGESIZE := 2048
       DEVICE_DTS_CONFIG := config@cp03-c1
       SOC := ipq6010
       DEVICE_PACKAGES := ipq-wifi-netgear_wax214
endef
TARGET_DEVICES += netgear_wax214