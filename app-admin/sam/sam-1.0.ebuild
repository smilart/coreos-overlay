
EAPI="5"

SLOT="0"

DESCRIPTION="Smilart application manager"
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
KEYWORDS="amd64"
#src_unpack() {
#   return
#}

EGIT_REPO_URIS="git://github.com/smilart/sam.git"
EGIT_SOURCEDIRS="${S}"
inherit git-2


src_install() {
   dosbin sam
}

src_compile() {
   return
}
