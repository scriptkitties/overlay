# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-vcs-snapshot

DESCRIPTION="Google Cloud Client Libraries for Go."
HOMEPAGE="https://godoc.org/cloud.google.com/go/"
EGO_PN="cloud.google.com/go"
SRC_URI="https://github.com/googleapis/google-cloud-go/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
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
