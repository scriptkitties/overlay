# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="c.darenet.org/tyil/${PN}"
EGIT_COMMIT="87539e1933c729bcd1b844cb641e4abc08cafbf8"

DESCRIPTION="Commandline application, written in Go, to install configuration files"
HOMEPAGE="http://tyil.work/project/gohan"
SRC_URI="https://${EGO_PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-go/colorize
	dev-go/git2go
	dev-go/golog
	dev-go/yaml
	dev-lang/go
"
RDEPEND=""

src_unpack() {
	unpack "${A}"
	mkdir -p "${S}/src/${EGO_PN}"
	mv ${WORKDIR}/${PN}-v${PV}-${EGIT_COMMIT}/* "${S}/src/${EGO_PN}"
}

src_compile() {
	cd "${S}/src/${EGO_PN}"
	emake || die "emake failed"
}

src_install() {
	cd "${S}/src/${EGO_PN}"
	emake DESTDIR="${D}" install
}
