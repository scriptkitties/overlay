# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Google's font family that aims to support all the world's languages"
HOMEPAGE="https://www.google.com/get/noto/"
_COMMIT=8ef14e6c606a7a0ef3943b9ca01fd49445620d79
# https://noto-website.storage.googleapis.com/pkgs/Noto-hinted.zip
# Version number based on the timestamp of most recently updated font in the zip.
# When bumping, remove *CJK* and create a tarball (xz -9 gives the most
# compressed tarball)
SRC_URI="https://github.com/googlei18n/noto-fonts/archive/$_COMMIT.tar.gz"
LICENSE="OFL-1.1" # https://github.com/googlei18n/noto-fonts/blob/master/NEWS
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 ~mips ppc ppc64 sparc x86"
IUSE="cjk"
S="${WORKDIR}/noto-fonts-${_COMMIT}"
RDEPEND="cjk? ( media-fonts/noto-cjk )"
RESTRICT="binchecks strip"
FONT_S="${S}/hinted"
FONT_SUFFIX="ttf"
