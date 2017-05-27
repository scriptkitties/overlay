# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="github.com/vaughan0/go-ini"
EGIT_COMMIT="a98ad7ee00ec53921f08832bc06ecf7fd600e6a1"

DESCRIPTION="INI parsing library for Go"
HOMEPAGE="https://github.com/vaughan0/go-ini/"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${PN}-${EGIT_COMMIT}" "${WORKDIR}/${P}"
}

src_compile() {
	:
}

src_install() {
	LIBDIR="${D}/usr/lib/go/src/${EGO_PN}"
	mkdir -p "${LIBDIR}"

	cp "${WORKDIR}/${P}/"*.go "${LIBDIR}" || die "Failed installing library"
}
