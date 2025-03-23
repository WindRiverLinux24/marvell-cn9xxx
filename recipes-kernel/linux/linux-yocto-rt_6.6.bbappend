require linux-yocto-marvell-cn96xx.inc

TARGET_SUPPORTED_KTYPES:append:marvell-cn96xx = " preempt-rt"

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
			   'v6.6/standard/preempt-rt/cn-sdkv6.1/octeon', \
			   'v6.6/standard/preempt-rt/cn-sdkv6.6/octeon', d)}"

KERNEL_FEATURES:append:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
					  ' bsp/marvell-cn96xx/features/sdkv6.1-feature/sdkv6.1-feature.scc', \
					  '', d)}"
