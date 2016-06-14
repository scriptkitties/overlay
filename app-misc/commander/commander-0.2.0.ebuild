# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="A dmenu wrapper in Python to command your system"
HOMEPAGE="https://c.darenet.org/tyil/commander"

EGIT_REPO_URI="https://c.darenet.org/tyil/commander.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/pymenu
	dev-python/python-mpd
"
