. /lib/functions.sh

mi_dualboot_check_image() {
	local ret=0

	local file_type="$( identify "$1" )"
	if [ "${file_type}" != ubi ]; then
		v "Unsupport file type: ${file_type}"
		v "Please use ubi file"
		ret=1
	fi

	local mtd="$( grep -oE 'ubi.mtd=[a-zA-Z0-9\-\_]*' /proc/cmdline | cut -d'=' -f2 )"
	if [[ "${mtd}" != "rootfs" ]] && [[ "${mtd}" != "rootfs_1" ]]; then
		v "Unable to determine UBIPART: ubi.mtd=${mtd}"
		ret=1
	fi

	if ! fw_printenv >/dev/null; then
		v "Fail to read U-Boot env"
		ret=1
	fi

	return ${ret}
}

mi_dualboot_do_upgrade() {
	mkdir -p /var/lock
	fw_printenv >/dev/null || return 1

	# Determine UBIPART
	local mtd="$( grep -oE 'ubi.mtd=[a-zA-Z0-9\-\_]*' /proc/cmdline | cut -d'=' -f2 )"
	case "${mtd}" in
		rootfs)
			CI_UBIPART="rootfs_1"
			local current=0
			;;
		rootfs_1)
			CI_UBIPART="rootfs"
			local current=1
			;;
		*)
			v "Unable to determine UBIPART: ubi.mtd=$mtd"
			return 1
			;;
	esac

	local mtdnum="$( find_mtd_index "${CI_UBIPART}" )"
	v "Flashing to ${CI_UBIPART}(mtd${mtdnum})"
	ubiformat "/dev/mtd${mtdnum}" -f "$1" -y || return 1
	sync

	ubiattach --mtdn "${mtdnum}"

	# Check to avoid the bug of the vendor U-Boot
	local ubidev="$( nand_find_ubi "${CI_UBIPART}" )"
	if [ -z "$( nand_find_volume "${ubidev}" "kernel" )" ]; then
		v "\"kernel\" volume doesn't exist, which causes a bug of the vendor U-Boot."
		v "When try to boot this system, U-Boot will always set flag_try_sys1_failed=0 even if this is the sysem 2"
		return 1
	fi

	# Restore configurations
	[ -f "${UPGRADE_BACKUP}" ] && CI_UBIPART="${CI_UBIPART}" nand_restore_config "${UPGRADE_BACKUP}"

	# Clean the failed flag. So we can boot to them.
	fw_setenv flag_try_sys1_failed 0 || return 1
	fw_setenv flag_try_sys2_failed 0 || return 1

	# Tell u-boot that the current is able to boot.
	fw_setenv flag_last_success ${current} || return 1

	# Tell u-boot to try to boot the other system.
	# If it failed, it will clean this flag.
	fw_setenv flag_ota_reboot 1 || return 1

	# When this flag is set to 0 and the `flag_ota_reboot` is 1,
	# the u-boot will roll back to `flag_last_success`.
	fw_setenv flag_boot_success || return 1
}
