# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Command line application for dealing with Twitch"
HOMEPAGE="http://tyil.work/project/twitch-cli"
SRC_URI="https://github.com/Tyil/twitch-cli/archive/v1.0.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install()
{
	dobin "src/twitch"
}
