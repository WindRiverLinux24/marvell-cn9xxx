FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DPDK_TARGET_MACHINE_marvell-cn91xx = "armada"
COMPATIBLE_MACHINE_marvell-cn91xx = "marvell-cn91xx"

SRC_URI_append_marvell-cn91xx = " \
	file://0001-mk-add-Marvell-ARMADA-architecture-based-on-armv8-a.patch \
	file://0002-checkpatch-add-ignore-params.patch \
	file://0003-devtools-checkpatches.sh-restore-execute-permission.patch \
	file://0004-net-mvpp2-fix-stack-corruption.patch \
	file://0005-net-mvpp2-reserve-4-rss-tables-for-lk-4.14-support.patch \
	file://0006-net-mvpp2-add-xstats_by_id-callbacks.patch \
	file://0007-net-mvpp2-cosmetic-changes-to-cookie-usage.patch \
	file://0008-net-mvpp2-call-destroy-function-only-for-relevant-de.patch \
	file://0009-net-mvpp2-align-checking-order.patch \
	file://0010-net-mvneta-fix-ierror-counted-twice.patch \
	file://0011-patches-fine-tuning-params-for-l2fwd-and-l3fwd-for-a.patch \
	file://0012-net-mvpp2-save-initial-configuration-in-pre-start-ph.patch \
	file://0013-patches-fine-tuning-params-for-l3fwd-for-a7k-a8k.patch \
	file://0014-net-mvpp2-add-loopback-support.patch \
	file://0015-net-lport-add-lport-PMD.patch \
	file://0016-Bump-dpdk-18.11-to-release-devel-19.01.0.patch \
	file://0017-net-mvneta-reset-stats-during-device-start.patch \
	file://0018-net-mvpp2-fix-BUG-in-link-up-flag.patch \
	file://0019-Bump-dpdk-18.11-to-release-devel-19.01.1.patch \
	file://0020-patches-ipsec-secgw-patches.patch \
	file://0021-docs-update-mvpp2-mvneta-mvsam-docs.patch \
	file://0022-examples-ipsec-secgw-Added-pri-field-in-ep1.cfg-file.patch \
	file://0023-meson-add-Marvell-ARMADA-architecture-based-on-armv8.patch \
	file://0024-net-mvpp2-add-vlan-offload-API-to-enable-vlan-filter.patch \
	file://0025-net-mvpp2-only-use-ol_flags-for-checksum-generation-.patch \
	file://0026-net-mvneta-only-use-ol_flags-for-checksum-generation.patch \
	file://0027-crypto-mvsam-added-full-offload-support.patch \
	file://0028-MAINTAINERS-update-Marvell-PMDs.patch \
	file://0029-net-mvpp2-remove-debug-log-on-fast-path.patch \
	file://0030-Bump-dpdk-18.11-to-release-devel-19.02.0.patch \
"

DEPENDS_append_marvell-cn91xx = " musdk-marvell libpcap"

export CONFIG_EXAMPLE_VM_POWER_MANAGER = "y"
export LIBMUSDK_PATH = "${PKG_CONFIG_SYSROOT_DIR}/usr"

do_configure_prepend_marvell-cn91xx () {
	sed -e "s#CONFIG_RTE_LIBRTE_PMD_PCAP=n#CONFIG_RTE_LIBRTE_PMD_PCAP=y#" -i ${S}/config/common_base
}
