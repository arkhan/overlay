EAPI=7

inherit bash-completion-r1

DESCRIPTION="Simple Python version management"
HOMEPAGE="https://github.com/pyenv/pyenv"
LICENSE="MIT"

SLOT="0"

SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		 venv? ( https://github.com/${PN}/${PN}-virtualenv/archive/v1.1.5.tar.gz -> ${PN}-virtualenv.tar.gz )"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion +venv"

RDEPEND="
	app-shells/bash
	bash-completion? (
		app-shells/bash-completion
		)
"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	use venv && unpack ${PN}-virtualenv.tar.gz
}

src_prepare() {
	if use venv; then
		cd ${WORKDIR}/${PN}-virtualenv-1.1.5
		eapply "${FILESDIR}/fix-symlink-308.patch"
		eapply_user
		cd ${WORKDIR}
		mv ${PN}-virtualenv-1.1.5 ${P}/plugins/venv
	fi
}

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

	use bash-completion && newbashcomp completions/pyenv.bash ${PN}

	if use venv; then
		for vbin in $(ls /usr/share/pyenv/plugins/venv/bin/*) ; do
			fperms 775 "$vbin"
			dosym "$vbin" /usr/bin/$(basename -- "$vbin")
		done
	fi
}
