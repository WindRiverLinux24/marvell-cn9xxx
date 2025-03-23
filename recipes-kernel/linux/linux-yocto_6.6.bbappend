require linux-yocto-marvell-cn96xx.inc

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
			   'v6.6/standard/cn-sdkv6.1/octeon', \
			   'v6.6/standard/cn-sdkv6.6/octeon', d)}"

KERNEL_FEATURES:append:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
					  ' bsp/marvell-cn96xx/features/sdkv6.1-feature/sdkv6.1-feature.scc', \
					  '', d)}"
