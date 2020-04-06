# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Rofi frontend for pass"
HOMEPAGE="https://github.com/carnager/rofi-pass"
SRC_URI="https://github.com/carnager/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="otp"

RDEPEND="
	x11-misc/xdg-utils
	x11-misc/rofi
	sys-apps/gawk
	app-admin/pass
	x11-misc/xdotool
	x11-misc/xclip
	app-admin/pwgen
	otp? ( app-admin/pass-otp )
"
DEPEND="${RDEPEND}"

src_compile() { :; }

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr"
}
