EAPI=7

DESCRIPTION="Simple Python version management"
HOMEPAGE="https://github.com/plattfot/pinentry-rofi"
LICENSE="Expat"

SLOT="0"

SRC_URI="https://github.com/plattfot/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-scheme/guile
	x11-misc/rofi
"
DEPEND="${RDEPEND}"

src_configure() { :; }
src_compile() { :; }

src_install() {
	into /usr/bin
	cp -R "${S}/pinentry-rofi.scm" "${D}/usr/bin/pinentry-rofi"
}
