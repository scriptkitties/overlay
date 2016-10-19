# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

DESCRIPTION="Void Linux kernel headers"
HOMEPAGE="https://voidlinux.eu/"

MY_PV="${PV}_1"
MY_MAJOR=$(echo "${MY_PV}" | awk -F. '{print $1"."$2}')

SRC_BASE="http://repo.voidlinux.eu/current"
SRC_AMD64_URI="${SRC_BASE}/linux${MY_MAJOR}-headers-${MY_PV}.x86_64.xbps"
SRC_X86_URI="${SRC_BASE}/linux${MY_MAJOR}-headers-${MY_PV}.i686.xbps"

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
	ln -s /usr/src/linux-"${PV}"-void /lib/modules/"${MY_PV}"/build  || die "Not able to symlink /usr/src/linux-"${PC}"-void to /lib/modules/"${MY_PV}"/build"
	ln -s /usr/src/linux-"${PC}"-void /lib/modules/"${MY_PV}"/source || die "Not able to symlink /usr/src/linux-"${PC}"-void to /lib/modules/"${MY_PV}"/source"

	# Place the config in the expected place for a gentoo system.
	mv /boot/config-"${MY_PV}" /usr/src/linux-"${PV}"-void/.config || die

	# Copy the System.map. The kernel deps will need manual `depmodding` if this isn't in place.
	cp /boot/System.map-"${MY_PV}" /usr/src/linux-"${PV}"-void/System.map || die "Not able to copy System.map"
}
