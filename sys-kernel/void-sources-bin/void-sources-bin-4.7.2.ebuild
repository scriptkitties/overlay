# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Void Linux distribution kernel"
HOMEPAGE="https://voidlinux.eu/"

MY_PV="${PV}_1"

SRC_BASE="http://repo.voidlinux.eu/current"
SRC_AMD64_URI="${SRC_BASE}/linux4.7-${MY_PV}.x86_64.xbps"
SRC_X86_URI="${SRC_BASE}/linux4.7-${MY_PV}.i686.xbps"

# .xbps is actually just .tar.xz. Rename it as such.
SRC_URI="
	amd64? ( ${SRC_AMD64_URI} -> void-linux_amd64-bin-${PV}.tar.xz )
	x86?   ( ${SRC_X86_URI}   -> void-linux_i386-bin-${PV}.tar.xz )
"

RESTRICT="mirror strip"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="dracut"
RDEPEND="
	dracut? ( sys-kernel/dracut )
"
PDEPEND="
	=sys-kernel/void-sources-headers-bin-${PV}
"

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
		elog "It's recommended you accomplish this using dracut. e.g."
		elog "\tdracut --kver ${ARCH}-${PV}-void\n"
	fi
}
