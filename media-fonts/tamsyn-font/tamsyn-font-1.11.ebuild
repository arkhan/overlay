# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/terminus-font/terminus-font-4.39.ebuild,v 1.2 2014/09/09 18:56:27 vapier Exp $

EAPI=4

inherit eutils font

DESCRIPTION="A monospaced bitmap font for the console and X11"
HOMEPAGE="http://www.fial.com/~scott/tamsyn-font"
SRC_URI="http://www.fial.com/~scott/${PN}/download/${PN}-${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="pcf psf.gz"

src_install() {
	insinto /usr/share/consolefonts
	doins *.psf.gz
	insinto /usr/share/fonts/tamsyn
	doins *.pcf
}
