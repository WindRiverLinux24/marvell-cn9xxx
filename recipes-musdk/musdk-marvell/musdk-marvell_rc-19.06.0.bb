SUMMARY = "MUSDK"
DESCRIPTION = "Marvell User Space SDK."
SECTION = "networking"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6187bee8ae9e73c1bfd4bff21c3e0f9b"

SRC_URI = " \
    file://sources-musdk-marvell-rc-19.06.0.tar.bz2 \
    file://0001-configure.ac-restore-normal-behavior-for-CC-LD-and-A.patch \
    file://0002-configure.ac-disable-Werror-causes-build-failures-du.patch \
    file://0001-Add-the-third-argument-for-the-open.patch \
"

inherit module
inherit autotools-brokensep

export KDIR = "${STAGING_KERNEL_BUILDDIR}"

DEPENDS = "virtual/kernel"

EXTRA_OECONF += ' \
    CROSS_COMPILE="${TARGET_PREFIX}" \
    --enable-pp2 \
    --disable-pp2-lock \
    --enable-neta \
    --enable-sam \
'

MODULES = "cma dmax2 neta pp2 sam"
MODULE_DIR = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/"

do_compile () {
    oe_runmake

    # Build the kernel modules
    for dir in ${MODULES}; do
        cd ${S}/modules/$dir && oe_runmake ARCH=arm64 CROSS_COMPILE=${TARGET_PREFIX}
    done
}

do_install () {
    autotools_do_install

    # Install the modules
    mkdir -p ${D}/${MODULE_DIR}/misc/
    cp ${S}/modules/cma/musdk_cma.ko  ${D}/${MODULE_DIR}/misc/

    mkdir -p ${D}/${MODULE_DIR}/uio/
    cp ${S}/modules/dmax2/mv_dmax2_uio.ko ${D}/${MODULE_DIR}/uio/
    cp ${S}/modules/neta/mv_neta_uio.ko ${D}/${MODULE_DIR}/uio/
    cp ${S}/modules/pp2/mv_pp_uio.ko ${D}/${MODULE_DIR}/uio/
    cp ${S}/modules/sam/mv_sam_uio.ko ${D}/${MODULE_DIR}/uio/
}

COMPATIBLE_MACHINE = "marvell-cn91xx"

FILES_${PN} += " ${prefix}/bin/ \
                 ${libdir}/libmusdk.so.0 \
                 ${libdir}/libmusdk.so.0.0.0 \
"
