# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="small bitmap font"
HOMEPAGE="https://github.com/lucy/tewi-font"
SRC_URI="https://github.com/lucy/tewi-font/archive/${PV}.tar.gz -> tewi-font-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

DEPEND="
	x11-apps/bdftopcf
"
RDEPEND=""

src_install() {
	mkdir -p "${D}/usr/share/fonts/misc"
	cp -r "${S}/out/"* "${D}/usr/share/fonts/misc/"
}
