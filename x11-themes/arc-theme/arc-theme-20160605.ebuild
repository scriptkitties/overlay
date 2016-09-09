# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="A flat theme with transparent elements"
HOMEPAGE="https://github.com/horst3180/arc-theme"
SRC_URI="https://github.com/horst3180/arc-theme/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="
	cinnamon
	+dark
	darker
	gnome-shell
	+gtk2
	+gtk3
	light
	metacity
	transparency
	unity
	xfwm
"
REQUIRED_USE="
	|| ( dark darker light )
"

DEPEND="
	x11-themes/gnome-themes-standard
	x11-themes/gtk-engines-murrine
"
RDEPEND="
	${DEPEND}
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable cinnamon) \
		$(use_enable dark) \
		$(use_enable darker) \
		$(use_enable gnome-shell) \
		$(use_enable gtk2) \
		$(use_enable gtk3) \
		$(use_enable light) \
		$(use_enable metacity) \
		$(use_enable transparency) \
		$(use_enable unity) \
		$(use_enable xfwm)
}
