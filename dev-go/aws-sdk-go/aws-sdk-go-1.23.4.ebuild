# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-vcs-snapshot

DESCRIPTION="AWS SDK for the Go programming language"
HOMEPAGE="https://aws.amazon.com/sdk-for-go/"
EGO_PN="github.com/aws/${PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/go
	>=dev-go/go-version-1.2.0
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
