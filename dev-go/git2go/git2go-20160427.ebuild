# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="github.com/libgit2/git2go"
EGIT_COMMIT="8eaae73f85dd3df78df80d2dac066eb0866444ae"

DESCRIPTION="Go bindings for git"
HOMEPAGE="https://github.com/libgit2/git2go/"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
	>=dev-libs/libgit2-0.24.0
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

	cp "${WORKDIR}/${P}"/*.{c,go} "${LIBDIR}" || die "Failed installing library"
}
