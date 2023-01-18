COMPATIBLE_MACHINE:marvell-cn96xx = "marvell-cn96xx"
TARGET_SUPPORTED_KTYPES:marvell-cn96xx = "standard"

KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV_machine:marvell-cn96xx ?= "${AUTOREV}"
SRCREV_meta:marvell-cn96xx ?= "${AUTOREV}"

KMACHINE:marvell-cn96xx ?= "marvell-cn96xx"

FILESEXTRAPATHS:prepend:marvell-cn96xx := "${THISDIR}/files:"
SRC_URI:append:marvell-cn96xx = " \
    file://0001-octeontx2-pf-Avoid-use-of-GFP_KERNEL-in-atomic-conte.patch \
    file://0002-octeontx2-pf-Drop-the-redundant-get-put_cpu-around-a.patch \
"
