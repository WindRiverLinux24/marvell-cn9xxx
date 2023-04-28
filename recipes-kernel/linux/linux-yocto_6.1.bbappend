require linux-yocto-marvell-cn96xx.inc

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
                          'v6.1/standard/cn-sdkv6.1/octeon', \
                          'v6.1/standard/cn-sdkv5.15/octeon', d)}"
