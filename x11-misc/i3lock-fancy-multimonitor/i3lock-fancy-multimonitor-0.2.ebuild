# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Blurry lock screen for i3lock with multimonitor support"
HOMEPAGE="https://github.com/cedricfarinazzo/i3lock-fancy-multimonitor"
SRC_URI="https://github.com/cedricfarinazzo/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

RDEPEND="app-shells/bash:0
		media-gfx/imagemagick
		virtual/awk
		x11-misc/wmctrl
		media-gfx/scrot
		x11-misc/i3lock"

DEPEND="${RDEPEND}"

src_configure() { :; }

src_compile() { :; }

src_install() {
	insinto /usr/share/${PN}
	insopts -m775
	doins -r *
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
}
