EAPI=7

DESCRIPTION="A Better 'less' - A bash script that loads emacs with minimal view-mode config - Created with Org mode"
HOMEPAGE="https://eless.scripter.co"
SRC_URI="https://github.com/kaushalmodi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-shells/bash
	>=virtual/emacs-23
"
DEPEND="${RDEPEND}"

S="${DISTFILES}"

src_compile() { :; }

src_install() {
	make eless
	dobin eless
}
