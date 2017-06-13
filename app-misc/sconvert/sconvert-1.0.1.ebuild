# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Commandline shellscript to convert a complete music collection to another format"
HOMEPAGE="http://tyil.work/project/sconvert"

EGIT_REPO_URI="https://c.darenet.org/tyil/sconvert.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}/

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-shells/bash:*
"
RDEPEND="
	${DEPEND}
"

src_install() {
	dobin "${S}/sconvert"
}
