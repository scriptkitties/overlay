# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Calculates the width in pixels of a string using a given Xft font"
HOMEPAGE="https://github.com/vixus0/xftwidth"
SRC_URI="https://github.com/vixus0/xftwidth/archive/master.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	x11-libs/libXft
	x11-libs/libX11
	x11-libs/libXrender
	media-libs/fontconfig
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack "${A}"
	mv -- "${WORKDIR}/${PN}-master" "${S}"
}

src_install() {
	dobin "${S}/xftwidth"
}
