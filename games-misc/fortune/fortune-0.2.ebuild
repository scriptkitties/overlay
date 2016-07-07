# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Displays a random fortune"
HOMEPAGE=""
SRC_URI="http://www.ibiblio.org/pub/Linux/games/amusements/fortune/fortune-0.2.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	unpack "${A}"
	cd "${S}"

	epatch "${FILESDIR}/${P}.patch"
	epatch "${FILESDIR}/${PN}-string.patch"

	eapply_user
}

src_install() {
	dobin "fortune"
}
