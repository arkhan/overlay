EAPI=7

DESCRIPTION="Simple clipboard manager to be integrated with rofi - Static binary available"
HOMEPAGE="https://github.com/mrichar1/clipster"
SRC_URI="
	https://github.com/erebe/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/erebe/${PN}/releases/download/${PV}/${PN}
"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-misc/rofi
"
DEPEND="${RDEPEND}"

S="${DISTFILES}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	cp "${DISTDIR}/greenclip" .
}

src_compile() { :; }

src_install() {
	dobin greenclip
}
