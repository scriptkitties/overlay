# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Not Quite Perl"
HOMEPAGE="https://github.com/perl6/nqp"
SRC_URI="https://github.com/perl6/nqp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	=dev-lang/moarvm-${PV}
"

src_compile() {
	perl Configure.pl \
		--backends=moar \
		--prefix=/usr

	make
}
