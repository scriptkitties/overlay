# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Command line application for dealing with Twitch"
HOMEPAGE="http://tyil.work/project/twitch-cli"

EGIT_REPO_URI="https://c.darenet.org/tyil/twitch.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}/src/c.darenet.org/tyil/twitch

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_compile() {
	mkdir -p "${S}/bin"
	GOPATH=${S} go build -o "${S}/bin/twitch" "${S}/src/c.darenet.org/tyil/twitch/main/twitch.go"
}

src_install() {
	dobin "${S}/bin/twitch"
}
