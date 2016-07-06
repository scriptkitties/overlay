# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-base

EGO_PN="c.darenet.org/tyil/golog"
EGIT_COMMIT="9354b2cb8c15c62062781e1ab37ce7842c59b2cb"

DESCRIPTION="Go library for logging"
HOMEPAGE="https://c.darenet.org/tyil/golog"
SRC_URI="https://${EGO_PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-go/colorize
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}/${PN}-v${PV}-${EGIT_COMMIT}" "${WORKDIR}/${P}"
}

src_compile() {
	:;
}

src_install() {
	LIBDIR="${D}/$(get_golibdir_gopath)/${EGO_PN}"
	mkdir -p "${LIBDIR}"

	cp ${WORKDIR}/${P}/* "${LIBDIR}" || die "Failed installing library"
}
