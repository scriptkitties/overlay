# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Free Universal SQL Client"
HOMEPAGE="http://dbeaver.jkiss.org/"
SRC_URI="https://github.com/serge-rider/dbeaver/archive/${PV}.tar.gz -> dbeaver-ce-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-java/maven-bin
	>=virtual/jdk-1.8
"
RDEPEND="
	>=virtual/jre-1.8
"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/dbeaver-${PV}" "${S}"
}

src_compile() {
	mvn package || die "Maven failed"
}

src_install() {
	mkdir -p "${D}/opt"
	cp -r "${S}/product/standalone/target/products/org.jkiss.dbeaver.core.product/linux/gtk/x86_64/dbeaver" "${D}/opt/dbeaver"

	newbin "${FILESDIR}/dbeaver.sh" dbeaver
}
