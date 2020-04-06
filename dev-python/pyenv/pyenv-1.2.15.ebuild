EAPI=7

inherit bash-completion-r1

DESCRIPTION="Simple Python version management"
HOMEPAGE="https://github.com/pyenv/pyenv"
LICENSE="MIT"

SLOT="0"

SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion"

RDEPEND="
	app-shells/bash
	bash-completion? (
		app-shells/bash-completion
		)
"
DEPEND="${RDEPEND}"

src_configure() { :; }

src_compile() { :; }

src_install() {
	insinto /usr/share/pyenv
	insopts -m775
	doins -r libexec
	dosym /usr/share/pyenv/libexec/pyenv /usr/bin/pyenv
	insopts -m644
	doins -r pyenv.d
	doins -r plugins
	for bin in $(ls /usr/share/pyenv/plugins/python-build/bin/*) ; do
		fperms 775 "$bin"
		dosym "$bin" /usr/bin/$(basename -- "$bin")
	done
	if use bash-completion; then
		newbashcomp completions/pyenv.bash ${PN}
	fi
}
