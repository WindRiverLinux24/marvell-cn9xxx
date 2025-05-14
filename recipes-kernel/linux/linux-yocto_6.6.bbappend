require linux-yocto-marvell-cn96xx.inc

KBRANCH:marvell-cn96xx = "${@bb.utils.contains('ENABLE_MARVELL_BASE61', '1', \
			   'v6.6/standard/cn-sdkv6.1/octeon', \
			   'v6.6/standard/cn-sdkv6.6/octeon', d)}"
