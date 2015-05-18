
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
   SRC_URI="git://github.com/smilart/sam.git;protocol=git"
   dosbin sam
}

src_compile() {
   return
}
