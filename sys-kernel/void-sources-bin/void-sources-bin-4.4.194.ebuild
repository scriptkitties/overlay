# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Void Linux distribution kernel"
HOMEPAGE="https://voidlinux.org/"

MY_PV="${PV}_1"
MY_MAJOR=$(/bin/sed -E 's/([0-9]+.[0-9]+).[0-9]+/\1/' <<< "${PV}");

SRC_BASE="http://http://alpha.de.repo.voidlinux.org/current"
SRC_AMD64_URI="${SRC_BASE}/linux${MY_MAJOR}-${MY_PV}.x86_64.xbps"

# .xbps is actually just .tar.xz. Rename it as such.
SRC_URI="
	amd64? ( ${SRC_AMD64_URI} -> void-linux_amd64-bin-${PV}.tar.xz )
"

RESTRICT="mirror strip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
	dracut +headers
"

RDEPEND="
	dracut? ( sys-kernel/dracut )"

PDEPEND="
	headers? ( =sys-kernel/void-sources-headers-bin-${PV}-r0 )"

S=${WORKDIR}

# This is a binary package. Portage should 'skip' these steps.
src_configure() { :; }
src_compile()   { :; }

src_install() {
	mv "boot" "${D}" || die
	dodir "/lib"
	mv "usr/lib/modules" "${D}/lib/modules" || die
}

pkg_postinst() {

	# Optionally build an initramfs using dracut, this is how the void package deals with it.
	if use dracut ; then
		einfo "Generating initramfs for kernel: ${MY_PV}"

		if dracut -f --kver "${MY_PV}" ; then
			einfo "Initramfs successfully generated!"
		else
			ewarn "Failed to generate initramfs for kernel: ${MY_PV}"
			die "Failed to generate initramfs for kernel: ${MY_PV}"
		fi
	else
		elog "\nTo make use of this kernel, you need to generate an initramfs."
		elog "It's recommended to use dracut. An example command is:"
		elog "\tdracut --kver ${ARCH}-${PV}-void\n"
	fi

	einfo "If using grub, you will need to make sure you have a"
	einfo "\troot=<device>"
	einfo "listing in your grub configuration. Users of boot-update will need to"
	einfo "configure this correctly in their /etc/boot.conf."
}
