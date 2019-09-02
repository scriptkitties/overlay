# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-vcs-snapshot

DESCRIPTION="A library for parsing and verifying versions and constraints."
HOMEPAGE="https://github.com/hashicorp/go-version"
EGO_PN="github.com/hashicorp/${PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+compile"

DEPEND="
	dev-lang/go
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	# If compile USE flag is not set, skip compilation.
	if ! use "compile"
	then
		return
	fi

	cd -- "${S}/src/${EGO_PN}" || die

	export GOPATH="${S}"
	export GOCACHE="${T}/go-cache"

	go build -v -work -o "${T}/${PN}" ./ \
		|| die
}

src_install() {
	# Install the compiled binary, if any.
	if use "compile"
	then
		dobin "${T}/${PN}"
	fi

	# Install Go source files.
	insinto "/usr/lib/go"
	doins -r "${S}/src"

	# Don't include test or non-Go files in the resulting image.
	find "${D}" -type f -iname "*_test.go" -delete
	find "${D}" -type f ! -iname "*.go" -delete
}
