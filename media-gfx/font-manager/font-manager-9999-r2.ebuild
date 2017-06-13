# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
VALA_MIN_API_VERSION=0.22

inherit eutils gnome2-utils vala

DESCRIPTION="A font management application for the GNOME desktop"
HOMEPAGE="https://font-manager.github.io"
MY_PN=FontManager
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/${MY_PN}/master.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_PN}/master/tarball/${PV} -> ${P}.tar.gz"
	inherit vcs-snapshot
	KEYWORDS="~amd64 ~x86"
fi
LICENSE="GPL-3"
SLOT="gtk3"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-db/sqlite-3.8:3
	>=dev-libs/glib-2.4
	>=dev-libs/json-glib-0.15
	>=dev-libs/libgee-0.1:0.8
	>=dev-libs/libxml2-2.4
	>=gnome-extra/gucharmap-3.1:2.90
	>=media-libs/fontconfig-2.1
	>=media-libs/freetype-2.5
	>=x11-libs/cairo-1.1
	>=x11-libs/gtk+-3.1:3
	>=x11-libs/pango-1.3
	sys-devel/gettext
	"
DEPEND="${RDEPEND}
	$(vala_depend)
	app-arch/file-roller
	app-text/yelp-tools
	dev-util/intltool
	gnome-base/gnome-common
	"

src_prepare() {
	vala_src_prepare
	export WANT_AUTOCONF=2.5
	NOCONFIGURE=yes ./autogen.sh || die
}

src_configure() {
	econf --disable-schemas-compile
}

src_compile() {
	emake -j1
}

src_install() {
	default
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
