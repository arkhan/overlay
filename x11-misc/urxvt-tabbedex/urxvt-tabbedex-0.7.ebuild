# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils multilib vcs-snapshot

MY_PN=${PN/urxvt-/}

DESCRIPTION="Tabbed plugin for rxvt-unicode with many enhancements"
HOMEPAGE="https://github.com/manwe-pl/urxvt-tabbedex.git"
SRC_URI="https://github.com/manwe-pl/urxvt-tabbedex/archive/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-terms/rxvt-unicode[perl]
	x11-misc/urxvt-perls"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	insinto /usr/$(get_libdir)/urxvt/perl
	doins ${MY_PN}
}