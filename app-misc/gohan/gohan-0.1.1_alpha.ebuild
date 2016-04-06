EAPI=6

inherit git-r3

DESCRIPTION="Commandline application, written in Go, to install configuration files"
HOMEPAGE="http://tyil.work/project/gohan"

EGIT_REPO_URI="https://c.darenet.org/tyil/gohan.git"
EGIT_COMMIT="v${PV}"
EGIT_CHECKOUT_DIR=${S}/src/c.darenet.org/tyil/gohan

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_prepare() {
	GOPATH=${S} go get c.darenet.org/tyil/golog
	GOPATH=${S} go get c.darenet.org/tyil/colorize

	mkdir -p "${S}/bin"

	eapply_user
}

src_compile() {
	GOPATH=${S} go build -o "${S}/bin/gohan" "${S}/src/c.darenet.org/tyil/gohan/main/gohan.go"
}

src_install() {
	dobin "${S}/bin/gohan"
}

