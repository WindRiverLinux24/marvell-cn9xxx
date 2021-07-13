EXTRA_KERNEL_FILES_prepend_marvell-cn96xx = "${THISDIR}/linux-yocto:"
EXTRA_KERNEL_SRC_URI_append_marvell-cn96xx += " \
    file://0001-mmc-cavium-thunderx-Drop-the-IRQF_NO_THREAD-constrai.patch \
    file://0002-pci-octeontx2-Workaround-for-PEM-config-space-writes.patch \
"
FILESEXTRAPATHS_prepend_osv-wrlinux := "${EXTRA_KERNEL_FILES}:"
