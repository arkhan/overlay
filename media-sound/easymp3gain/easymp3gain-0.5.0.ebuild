# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="GUI for aacgain, mp3gain and vorbisgain"
HOMEPAGE="http://easymp3gain.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/fpc-2.4.0
	>=dev-lang/lazarus-0.9.28
	>=media-sound/mp3gain-1.5.2"
RDEPEND="x11-libs/gtk+:2"

src_prepare(){
	epatch ${FILESDIR}/bug_3556716.patch
	epatch ${FILESDIR}/fix_missing_overload_on_AddTask.diff
	cd ${WORKDIR}/${P}/applications
	perl -i -pe 's/x-easymp3gain/x-easymp3gain;/g' easymp3gain.desktop
	perl -i -pe 's/Audio;AudioVideo/Audio;AudioVideo;/g' easymp3gain.desktop
		cd ${WORKDIR}/${P}
	mkdir "lazarus-build"
	cp ${FILESDIR}/environmentoptions.xml lazarus-build/
	epatch ${FILESDIR}/fix_missing_LazarusDir.diff
}
