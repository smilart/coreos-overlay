# Copyright 2016 The SmialrtOS Authors

EAPI="5"

DESCRIPTION="Configure user smilart."
HOMEPAGE="http://smilart.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-perl/Crypt-PasswdMD5"

src_install() {
   enewuser smilart 0 -1 -1 "sudo,docker" -p `mkpasswd  -m sha-512 -S saltsalt -s <<< smilart`
   dodir /data/share
}

src_compile() {
   return
}
