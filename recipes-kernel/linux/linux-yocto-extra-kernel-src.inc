EXTRA_KERNEL_FILES_prepend_marvell-cn96xx = "${THISDIR}/linux-yocto:"
EXTRA_KERNEL_SRC_URI_append_marvell-cn96xx += " \
    file://0001-Mailbox-Fix-compile-error-caused-by-spell-mistake-of.patch \
"
FILESEXTRAPATHS_prepend_osv-wrlinux := "${EXTRA_KERNEL_FILES}:"

