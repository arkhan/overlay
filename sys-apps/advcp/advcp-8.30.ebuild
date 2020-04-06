EAPI=7

DESCRIPTION="'cp' and 'mv' utilities with progress bar patches"
HOMEPAGE="https://www.gnu.org/software/coreutils/"
LICENSE="GPLv3"

SLOT="0"

SRC_URI="ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.xz -> ${P}.tar.xz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
	sys-libs/glibc
	sys-libs/pam
	sys-apps/acl
	dev-libs/gmp
	sys-libs/libcap
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/coreutils-${PV}"

src_prepare() {
	eapply "${FILESDIR}/advcpmv-0.8-${PV}.patch"
	eapply_user
}
src_compile() {
	./configure --prefix=/usr \
				--libexecdir=/usr/lib \
				--enable-no-install-program=groups,hostname,kill,uptime
	make $MAKEFLAGS -j1
}

src_install() {
	insinto /usr/bin
	newbin src/cp advcp
	dosym /usr/bin/advcp /usr/bin/acp
	dosym /usr/bin/advcp /usr/bin/cpg
	newbin src/mv advmv
	dosym /usr/bin/advmv /usr/bin/amv
	dosym /usr/bin/advmv /usr/bin/mvg
}
