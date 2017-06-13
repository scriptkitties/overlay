# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_COMMIT="c2fb5057ee05e70f056c69d634ee0d1f82e6e20b"

DESCRIPTION="Assisting application for mpd"
HOMEPAGE="https://c.darenet.org/scriptkitties/mpa"
SRC_URI="https://c.darenet.org/scriptkitties/mpa/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libnotify
	media-libs/libmpdclient
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${PN}-${EGIT_COMMIT}-${EGIT_COMMIT}" "${S}" || die "unpack failed"
}
