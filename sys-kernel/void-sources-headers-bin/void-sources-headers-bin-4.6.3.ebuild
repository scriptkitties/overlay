# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Void Linux kernel headers"
HOMEPAGE="https://voidlinux.eu/"

MY_PV="${PV}_1"

SRC_BASE="http://repo.voidlinux.eu/current"
SRC_AMD64_URI="${SRC_BASE}/linux4.6-headers-${MY_PV}.x86_64.xbps"
SRC_X86_URI="${SRC_BASE}/linux4.6-headers-${MY_PV}.i686.xbps"

# .xbps is actually just .tar.xz. Rename it as such.
SRC_URI="
	amd64? ( ${SRC_AMD64_URI} -> void-linux-headers_amd64-bin-${PV}.tar.xz )
	x86?   ( ${SRC_X86_URI}   -> void-linux-headers_i386-bin-${PV}.tar.xz )
"

RESTRICT="mirror strip"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	=sys-kernel/void-sources-bin-${PV}
"

S=${WORKDIR}

# This is a binary package. Portage should 'skip' these steps.
src_configure() { :; }
src_compile()   { :; }

src_install() {
	dodir /usr/src
	mv usr/src/kernel-headers-"${MY_PV}" "${D}"/usr/src/linux-"${PV}"-void || die
}

pkg_postinst() {
	# Allow us to build externel kernel modules
	ln -s /usr/src/linux-"${PV}"-void /lib/modules/"${MY_PV}"/build || die "Not able to symlink headers to the modules directory"

	# Put the config in the correct place
	mv /boot/config-"${MY_PV}" /usr/src/linux-"${PV}"-void/.config || die
}
