EAPI=7

DESCRIPTION="Simple Python version management"
HOMEPAGE="https://github.com/pyenv/pyenv"
LICENSE="MIT"

SLOT="0"

SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-shells/bash
"
DEPEND="${RDEPEND}"

src_configure() { :; }

src_compile() { :; }

src_install() {
	insinto /usr/share/pyenv
	doins -r libexec
	fperms 755 /usr/share/pyenv/libexec/*
	doins -r pyenv.d
	doins -r plugins
	fperms 755 /usr/share/pyenv/plugins/python-build/bin/*
	PYENV=/usr/share/pyenv/libexec/*
	for bin in $PYENV
	do
		dosym "$bin" /usr/bin/$(basename -- "$bin")
	done
	PYTHON_BUILD=/usr/share/pyenv/plugins/python-build/bin/*
	for bin in $PYTHON_BUILD
	do
		dosym "$bin" /usr/bin/$(basename -- "$bin")
	done
}
