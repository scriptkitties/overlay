# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="An icon pack designed to fit with the arc-theme."
HOMEPAGE="https://github.com/horst3180/arc-icon-theme"
SRC_URI="https://github.com/horst3180/arc-icon-theme/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
REQUIRED_USE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	default
	eautoreconf
}
