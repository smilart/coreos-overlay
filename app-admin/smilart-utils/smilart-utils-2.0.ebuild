
EAPI="5"

SLOT="0"

DESCRIPTION="Smilart utils"
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
KEYWORDS="amd64"

EGIT_REPO_URI="git@github.com:smilart/smilart.os.utils.git"
EGIT_SOURCEDIRS="${S}"
inherit git-2

src_install() {
   dosbin cluster-config
   dosbin datetime-config
   dosbin network-config 
}

src_compile() {
   return
}
