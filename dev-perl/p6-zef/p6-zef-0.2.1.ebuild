# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Perl 6 module management"
HOMEPAGE="https://github.com/ugexe/zef"
SRC_URI="https://github.com/ugexe/zef/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	virtual/perl6
"

src_unpack() {
	unpack ${A}
	mv "zef-${PV}" "${P}"
}

src_compile() {
	:;
}

src_install() {
	local p6dir="${D}/usr/share/perl6"

	mkdir -p "${p6dir}"

	perl6 -Ilib bin/zef \
		install \
		--install-to=${p6dir} \
		--/test \
		.

	rm "${p6dir}/repo.lock"
	rm "${p6dir}/version"
	rm "${p6dir}/precomp/.lock"
}
