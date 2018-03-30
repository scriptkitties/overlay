# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm;

DESCRIPTION="Free Universal SQL Client"
HOMEPAGE="http://dbeaver.jkiss.org/"
SRC_URI="https://dbeaver.jkiss.org/files/${PV}/dbeaver-ce-${PV}-stable.x86_64.rpm"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
"
RDEPEND="
	>=virtual/jre-1.8
"

src_unpack() {
	rpm_src_unpack ${A}
	mkdir "${PF}"
	mv "usr" "${PF}"
}

src_prepare() {
	eapply_user
	sed -i '/WM_CLASS=/d' "${WORKDIR}/${PF}/usr/share/applications/dbeaver.desktop"
}

src_configure() { :; }
src_compile() { :; }

src_install() {
	cp -r "${WORKDIR}/${PF}"/* "${D}"/.
}
