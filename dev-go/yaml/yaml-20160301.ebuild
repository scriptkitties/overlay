# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="github.com/go-yaml/yaml"
EGIT_COMMIT="a83829b6f1293c91addabc89d0571c246397bbf4"

DESCRIPTION="Implements YAML support for the Go language"
HOMEPAGE="https://github.com/go-yaml/yaml/"
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
	unpack "${A}"
	mv "${WORKDIR}/${PN}-${EGIT_COMMIT}" "${WORKDIR}/${P}"
}

src_compile() {
	:
}

src_install() {
	LIBDIR="${D}/usr/lib/go/src/${EGO_PN}"
	mkdir -p "${LIBDIR}"

	cp ${WORKDIR}/${P}/*.go "${LIBDIR}" || die "Failed installing library"
}
