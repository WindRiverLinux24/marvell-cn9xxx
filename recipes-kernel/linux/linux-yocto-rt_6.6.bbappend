require linux-yocto-marvell-cn96xx.inc

TARGET_SUPPORTED_KTYPES:append:marvell-cn96xx = " preempt-rt"

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
			   'v6.6/standard/preempt-rt/cn-sdkv6.1/octeon', \
			   'v6.6/standard/preempt-rt/cn-sdkv6.6/octeon', d)}"
