# Copyright 2014-2015 Jonathan Vasquez <jvasquez1011@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit user distutils-r1 eutils

GITHUB_USER="syncthing"
GITHUB_REPO="syncthing-gtk"
GITHUB_TAG="${PV}"

NAME="syncthing-gtk"
DESCRIPTION="GTK3 Gui for SyncThing Open Source Continuous File Synchronization"
HOMEPAGE="http://syncthing.net/"

SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/v${GITHUB_TAG}.tar.gz -> ${P}.tar.gz"

RESTRICT="mirror"
LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
    net-p2p/syncthing
    >=x11-libs/gtk+-3.12:3
    dev-lang/python
    dev-python/python-dateutil
    dev-python/pyinotify
    dev-python/pycairo
    dev-python/setuptools
"

RDEPEND="${DEPEND}"

python_compile(){
    distutils-r1_python_compile
} 

python_install_all() {
    distutils-r1_python_install_all
}