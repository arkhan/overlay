# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1 eutils

DESCRIPTION="simple clipboard manager"
HOMEPAGE="https://github.com/mrichar1/clipster"
SRC_URI="https://github.com/mrichar1/clipster/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-libs/libwnck
	dev-lang/python
	dev-python/pygobject
"
DEPEND="${RDEPEND}
	dev-python/setuptools
"
src_compile () { :; }

src_install () {
	dobin clipster
}
