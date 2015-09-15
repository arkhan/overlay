# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1
inherit git-r3

DESCRIPTION="pybox2d is a 2D physics library for your games and
simulation. It's based on the Box2D library, written in C++. It
supports several shape types (circle, polygon, thin line segments), 
and quite a few joint types (revolute, prismatic, wheel, etc.)."
HOMEPAGE="https://github.com/pybox2d/pybox2d https://pypi.python.org/pypi/Box2D/2.3b0"
EGIT_REPO_URI="git://github.com/pybox2d/pybox2d.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""

S="${WORKDIR}/${P}"

python_install_all() {
	distutils-r1_python_install_all
}
