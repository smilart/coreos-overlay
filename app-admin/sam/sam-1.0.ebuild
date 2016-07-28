# Copyright 2015 The SmilartOS Authors

EAPI="5"
CROS_WORKON_PROJECT="smilart/sam"
CROS_WORKON_LOCALNAME="sam"
CROS_WORKON_REPO="git://github.com"
CROS_WORKON_COMMIT="89d6d9560122e03518cbfe28ad6bc3660587755b" # v1.5

DESCRIPTION="Smilart application manager"
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

EGIT_REPO_URI="git://github.com/smilart/sam.git"
EGIT_SOURCEDIRS="${S}"

inherit git-2 cros-workon

src_install() {
   dosbin sam
}

src_compile() {
   return
}
