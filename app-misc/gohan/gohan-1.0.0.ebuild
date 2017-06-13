# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="c.darenet.org/tyil/${PN}"
EGIT_COMMIT="6228dc3f52a99f7dd2dd4eaefac3d7fa98b07eac"

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
	dev-go/go-ini
	dev-go/golog
	dev-go/yaml
	dev-lang/go
"
RDEPEND=""

src_unpack() {
	unpack ${A}
	mkdir -p "${S}/src/${EGO_PN}"
	mv "${WORKDIR}/${PN}-v${PV}-${EGIT_COMMIT}"/* "${S}/src/${EGO_PN}/." || die "unpack failed"
}

src_compile() {
	cd "${S}/src/${EGO_PN}"
	echo "$(pwd)"
	emake \
		GOPATH="${S}" \
		|| die "emake failed"
}

src_install() {
	cd "${S}/src/${EGO_PN}"
	emake DESTDIR="${D}" install
}
