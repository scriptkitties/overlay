# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SHell Compatibility Tester"
HOMEPAGE="https://gitlab.com/tyil/shct"
SRC_URI="https://gitlab.com/tyil/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="
	+bash
	dash
	fish
	ksh
	sash
	scsh
	tcsh
	yash
	zsh
	+minimal
"

RDEPEND="
	bash? ( app-shells/bash )
	dash? ( app-shells/dash )
	fish? ( app-shells/fish )
	ksh? ( app-shells/ksh )
	sash? ( app-shells/sash )
	scsh? ( app-shells/scsh )
	tcsh? ( app-shells/tcsh )
	yash? ( app-shells/yash )
	zsh? ( app-shells/zsh )
"

src_prepare() {
	eapply_user

	sed 's@%%PATCH_THIS_FOR_YOUR_OS%%@/usr/share/shct@' \
		< bin/shct > "${T}/shct"

	cp "${T}/shct" bin/shct
}

src_install() {
	dobin bin/shct

	# Add installation suggestions
	insinto /usr/share/shct

	if use minimal
	then
		doins install-cmds/gentoo
	else
		doins -r install-cmds
	fi
}
