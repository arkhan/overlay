# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Pilas es un motor para realizar videojuegos de manera rápida y sencilla."
HOMEPAGE="http://www.pilas-engine.com.ar https://github.com/hugoruscitti/pilas"

if [[ ${PV} == "9999" ]] ; then
   EGIT_REPO_URI="git://github.com/hugoruscitti/pilas.git"
   inherit git-r3
else
   SRC_URI="https://github.com/hugoruscitti/${MY_PN}/archive/${PV}.zip -> ${MY_PN}-${PV}.zip"
   KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPLv3"
SLOT="0"

DEPEND="
    dev-python/PyQt4
    dev-python/Box2D
"

RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
}
