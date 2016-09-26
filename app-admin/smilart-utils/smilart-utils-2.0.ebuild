# Copyright 2015 The SmilartOS Authors

EAPI="5"
CROS_WORKON_PROJECT="smilart/smilart.os.utils"
CROS_WORKON_LOCALNAME="smilart-utils"
CROS_WORKON_REPO="git://github.com"
CROS_WORKON_COMMIT="62c2560b4f8666af17c7c8264bb639006b13c021"

DESCRIPTION="Smilart utils"
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

EGIT_REPO_URI="https://github.com/smilart/smilart.os.utils.git"
EGIT_SOURCEDIRS="${S}"

inherit git-2 cros-workon

src_install() {
   dosbin datetime-config
   dosbin network-config
   dosbin distribution-config
}

src_compile() {
   return
}
