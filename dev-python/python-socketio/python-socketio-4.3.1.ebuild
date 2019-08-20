# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Python Socket.IO server and client"
HOMEPAGE="https://github.com/miguelgrinberg/python-socketio"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/setuptools
	dev-python/six
	dev-python/python-engineio
"
RDEPEND="${DEPEND}"
