# Copyright 2016 The SmialrtOS Authors

EAPI="5"

DESCRIPTION="Configure user smilart."
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-perl/Crypt-PasswdMD5"

pkg_setup() {
   enewuser smilart 0 -1 -1 "sudo,docker" -p '$6$0bTvMYUQxTg$dnuElNfnkbyZPT2o7dw0npzIAN816DJup/Qe6EV1xXCkzUlzAMLF8t4MKB/zE5kzB0xIVPfXwDBYo.Ez7KOzC.' || die
   dodir /data/share || die
}
