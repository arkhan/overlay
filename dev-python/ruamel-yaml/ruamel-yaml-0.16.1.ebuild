EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1 eutils

DESCRIPTION="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
HOMEPAGE="https://bitbucket.org/ruamel/yaml"
RESTRICT="mirror"
SRC_URI="https://bitbucket.org/ruamel/yaml/downloads/ruamel.yaml-${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux"
IUSE=""

RDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
