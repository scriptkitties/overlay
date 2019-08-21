# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-vcs-snapshot

DESCRIPTION="errors with stacktraces for go"
HOMEPAGE="https://github.com/go-errors/errors"
EGO_PN="github.com/go-errors/${PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() { :; }

src_install() {
	# Install Go source files.
	insinto "/usr/lib/go"
	doins -r "${S}/src"

	# Don't include test or non-Go files in the resulting image.
	find "${D}" -type f -iname "*_test.go" -delete
	find "${D}" -type f ! -iname "*.go" -delete
}
