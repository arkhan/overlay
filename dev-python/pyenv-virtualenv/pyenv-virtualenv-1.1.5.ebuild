EAPI=7

DESCRIPTION="a pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
HOMEPAGE="https://github.com/pyenv/pyenv"
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
	insinto /opt/pyenv/plugins/pyenv-virtualenv
	insinto /opt/pyenv/plugins/pyenv-virtualenv/usr
	insinto /opt/pyenv/plugins/pyenv-virtualenv/bin
	PREFIX="/opt/pyenv/plugins/pyenv-virtualenv" ./install.sh
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-activate /usr/bin/pyenv-activate
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-deactivate /usr/bin/pyenv-deactivate
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-sh-activate /usr/bin/pyenv-sh-activate
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-sh-deactivate /usr/bin/pyenv-sh-deactivate
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv /usr/bin/pyenv-virtualenv
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv-delete /usr/bin/pyenv-virtualenv-delete
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv-init /usr/bin/pyenv-virtualenv-init
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenv-prefix /usr/bin/pyenv-virtualenv-prefix
	dosym /opt/pyenv/plugins/pyenv-virtualenv/bin/pyenv-virtualenvs /usr/bin/pyenv-virtualenvs
}
