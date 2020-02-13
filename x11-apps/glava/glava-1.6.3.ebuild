# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenGL audio spectrum visualizer "
HOMEPAGE="https://github.com/wacossusca34/glava"
SRC_URI="https://github.com/wacossusca34/glava/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="
	glfw
"

DEPEND="
	media-sound/pulseaudio
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/lua
	dev-lua/lgi
	dev-lua/luafilesystem
	dev-util/meson
	x11-libs/gtk+:3
	glfw? ( media-libs/glfw )
"

src_compile() {
	if use glfw ; then
		FLAGS="ENABLE_GLFW=1"
	fi

	$FLAGS emake
}
