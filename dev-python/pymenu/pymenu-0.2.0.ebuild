# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 )

inherit distutils-r1 git-r3

DESCRIPTION="A python wrapper for calling dmenu"
HOMEPAGE="https://c.darenet.org/tyil/pymenu"

EGIT_REPO_URI="https://c.darenet.org/tyil/pymenu.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
