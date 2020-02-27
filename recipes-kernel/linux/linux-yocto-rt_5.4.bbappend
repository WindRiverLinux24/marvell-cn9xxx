KBRANCH_marvell-cn96xx  = "v5.4/standard/preempt-rt/cn96xx"

require linux-yocto-marvell-cn96xx.inc

TARGET_SUPPORTED_KTYPES_append_marvell-cn96xx = " preempt-rt"

LINUX_VERSION_marvell-cn96xx ?= "5.4.x"
