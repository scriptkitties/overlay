# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="c.darenet.org/tyil/${PN}"
EGIT_COMMIT="f3a2749872cd51c249a597bc2ff70113e723cd80"

DESCRIPTION="Commandline application, written in Go, to install configuration files"
HOMEPAGE="http://tyil.work/project/gohan"
SRC_URI="https://${EGO_PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-go/colorize
	dev-go/golog
	dev-lang/go
	dev-libs/libgit2
"
RDEPEND=""

src_unpack() {
	unpack "${A}"
	mkdir -p "${S}/src/${EGO_PN}"
	mv ${WORKDIR}/${PN}-v${PV}-${EGIT_COMMIT}/* "${S}/src/${EGO_PN}/."
}

src_prepare() {
	GOPATH=${S} go get github.com/libgit2/git2go
	GOPATH=${S} go get gopkg.in/yaml.v2

	mkdir -p "${D}/bin"

	eapply_user
}

src_compile() {
	GOPATH=${S} go build -o "${D}/bin/gohan" "${S}/src/${EGO_PN}/main/gohan.go"
}
