# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Slightly nicer wrapper around Nmap's ndiff(1)"
HOMEPAGE="https://sanctum.geek.nz/cgit/nwatch.git/about/"
SRC_URI="https://sanctum.geek.nz/cgit/${PN}.git/snapshot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	net-analyzer/nmap
"
BDEPEND=""

src_compile() { :; }

src_install() {
	dobin nwatch
	dodoc nwatch.1
}
