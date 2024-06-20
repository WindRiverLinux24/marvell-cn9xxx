require linux-yocto-marvell-cn96xx.inc

KBRANCH:marvell-cn96xx = "v6.6/standard/preempt-rt/cn-sdkv6.1/octeon"

TARGET_SUPPORTED_KTYPES:append:marvell-cn96xx = " preempt-rt"
