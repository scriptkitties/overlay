# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A modern VM built for Rakudo Perl 6."
HOMEPAGE="https://www.moarvm.org/"
SRC_URI="https://www.moarvm.org/releases/MoarVM-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	virtual/libffi
"

src_unpack() {
	unpack "${A}"
	mv "MoarVM-${PV}" "${P}"
}

src_configure() {
	perl Configure.pl \
		--libdir=$(get_libdir) \
		--has-libffi \
		--prefix=/usr
}
