# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A small Bash application to install the Rakudo Star Perl 6 distribution"
HOMEPAGE="https://github.com/tyil/lonestar"
SRC_URI="https://github.com/tyil/lonestar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:;
}

src_install() {
	emake DESTDIR="${D}/usr" install
}
