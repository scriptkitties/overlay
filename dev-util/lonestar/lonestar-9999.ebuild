# Copyright 2018 Patrick Spek <p.spek@tyil.nl>
#
# Distributed under the terms of the GNU Affero General Public License v3

EAPI=6

DESCRIPTION="A small Bash application to install the Rakudo Star Perl 6 distribution"
HOMEPAGE="https://gitlab.com/tyil/lonestar"
SRC_URI="https://gitlab.com/tyil/lonestar/-/archive/master/lonestar-master.tar.gz -> ${P}.tar.gz"

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
