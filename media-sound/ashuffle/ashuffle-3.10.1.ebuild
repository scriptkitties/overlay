# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Shuffle your MPD library"
HOMEPAGE="https://github.com/joshkunz/ashuffle"
SRC_URI="https://dist.tyil.nl/gentoo/${PN}/${PF}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-libs/libmpdclient
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	dev-util/ninja
"
