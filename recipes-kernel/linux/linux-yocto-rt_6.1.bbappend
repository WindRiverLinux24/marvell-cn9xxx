require linux-yocto-marvell-cn96xx.inc

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE515', '0', \
                          'v6.1/standard/preempt-rt/cn-sdkv6.1/octeon', \
                          'v6.1/standard/preempt-rt/cn-sdkv5.15/octeon', d)}"

TARGET_SUPPORTED_KTYPES:append:marvell-cn96xx = " preempt-rt"
