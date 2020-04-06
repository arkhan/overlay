EAPI=7

DESCRIPTION="a pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
HOMEPAGE="https://github.com/pyenv/pyenv-virtualenv"
LICENSE="MIT"

SLOT="0"

SRC_URI="https://github.com/pyenv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-shells/bash
	dev-python/pyenv
"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}/fix-symlink-308.patch"
	eapply_user
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	insinto /usr/share/pyenv/plugins/virtualenv
	insopts -m644
	doins -r .
	for bin in $(ls /usr/share/pyenv/plugins/virtualenv/bin/*) ; do
		fperms 775 "$bin"
		dosym "$bin" /usr/bin/$(basename -- "$bin")
	done
}
