# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby20 ruby21 ruby22"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
inherit ruby-fakegem
if [[ "${PV%9999}" != "${PV}" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/defunkt/gist.git"
	SRC_URI=""
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/defunkt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Upload code to gist.github.com"
HOMEPAGE="https://github.com/defunkt/gist"

LICENSE="MIT"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/json:2
	dev-ruby/webmock:2
"

all_ruby_prepare() {
	ls -a
	mkdir -p all
	mv "${P}" all/
	sed -e '/git ls-files/d' -i "${WORKDIR}"/all/${P}/gist.gemspec
}

all_ruby_install() {
	all_fakegem_install
	doman build/${PN}.1
}
