# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="c.darenet.org/tyil/${PN}"
EGIT_COMMIT="eae7225dfc63f97cbdb45fd1fc223baf11ae43f1"

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
