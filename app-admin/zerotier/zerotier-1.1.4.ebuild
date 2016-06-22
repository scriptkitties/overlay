# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="nondescript"
HOMEPAGE="https://www.zerotier.com/"
SRC_URI="https://github.com/zerotier/ZeroTierOne/archive/${PV}.tar.gz -> zerotier-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"

	mv "${WORKDIR}/ZeroTierOne-${PV}" "${WORKDIR}/zerotier-${PV}"
}

src_compile() {
	make || die "make failed"
	make installer || die "make installer failed"
}

src_install() {
	newbin "${S}/zerotier-one" "zerotier-cli"
	newbin "${S}/ZeroTierOneInstaller-linux-x64-${PV//./_}" "zerotier-installer"
}
