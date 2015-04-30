
EAPI="5"

SLOT="0"

DESCRIPTION="Smilart application manager"
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
KEYWORDS="amd64"
#src_unpack() {
#   return
#}


src_install() {
   newsbin "${FILESDIR}/sam sam
}

src_compile() {
   return
}
