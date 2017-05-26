# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Off-The-Record messaging (OTR) for hexchat"
AUTH="TingPing"
HOMEPAGE="https://github.com/${AUTH}/${PN}"
SRC_URI="https://github.com/${AUTH}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~sparc ~x86"

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/libgcrypt-1.7.3
	>=net-libs/libotr-4.1.0
	net-irc/hexchat"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig"

DOCS=( Readme.md )

src_prepare() {
	default
	eautoreconf
}
