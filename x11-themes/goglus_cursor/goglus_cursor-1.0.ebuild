# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Goglus X11 cursor theme"
HOMEPAGE="https://www.opendesktop.org/p/999675/"

SRC_URI="https://github.com/arkhan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-apps/xcursorgen"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_compile() {
	cd "${S}/source" || die
	mkdir cursors || die
	sh ./make.sh || die
}

src_install() {
	insinto /usr/share/icons/Goglus/cursors
	doins -r source/cursors/*
	insinto /usr/share/icons/Goglus
	doins index.theme
}
