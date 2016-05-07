# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Commandline application, written in Go, to install configuration files"
HOMEPAGE="http://tyil.work/project/gohan"

EGIT_REPO_URI="https://c.darenet.org/tyil/gohan.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}/src/c.darenet.org/tyil/gohan

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lang/go
	dev-libs/libgit2
"
RDEPEND=""

src_prepare() {
	GOPATH=${S} go get c.darenet.org/tyil/golog
	GOPATH=${S} go get c.darenet.org/tyil/colorize
	GOPATH=${S} go get github.com/libgit2/git2go

	mkdir -p "${S}/bin"

	eapply_user
}

src_compile() {
	GOPATH=${S} go build -o "${S}/bin/gohan" "${S}/src/c.darenet.org/tyil/gohan/main/gohan.go"
}

src_install() {
	dobin "${S}/bin/gohan"
}
