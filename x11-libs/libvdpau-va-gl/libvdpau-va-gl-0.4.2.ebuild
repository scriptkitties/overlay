# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake virtualx pax-utils

DESCRIPTION="VDPAU driver with VA-API/OpenGL backend."
HOMEPAGE="https://github.com/i-rinat/libvdpau-va-gl/"
SRC_URI="https://github.com/i-rinat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/glib:2
	media-libs/glu
	media-video/ffmpeg
	virtual/opengl
	x11-libs/libva[X]
	x11-libs/libvdpau
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="${RDEPEND}"

DOCS=(ChangeLog README.md)

src_compile() {
	cmake_src_compile
	if use test; then
		cmake_src_compile build-tests
		pax-mark m "${BUILD_DIR}"/tests/test-*
	fi
}

src_test() {
#	VIRTUALX_COMMAND=cmake_src_test virtualmake
	virtx cmake_src_test
}

pkg_postinst() {
	elog 'To make this work you have to check if the correct driver has been deteted'
	elog "grep -iE 'vdpau|dri driver' /var/log/Xorg.0.log"
	elog 'You should get va_gl for Intel or AMD closed source drivers'
	elog "or get `nvidia` for NVIDIA's closed source drivers."
	elog "Otherwise you will have to set the env var `VDPAU_DRIVER=va_gl/nvidia`"
	elog "depending on your drivers"
}
