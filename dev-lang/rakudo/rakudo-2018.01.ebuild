# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Perl 6 on MoarVM"
HOMEPAGE="http://rakudo.org/"
SRC_URI="https://github.com/rakudo/rakudo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	=dev-lang/nqp-${PV}
"

src_configure() {
	perl Configure.pl \
		--backends=moar \
		--prefix=/usr
}
