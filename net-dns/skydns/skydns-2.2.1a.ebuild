
EAPI="5"

SLOT="0"

inherit systemd

DESCRIPTION="SkyDNS is a distributed service for announcement and discovery of services built on top of etcd."
HOMEPAGE="https://github.com/skynetservices/skydns"

LICENSE="MIT"
KEYWORDS="amd64"

SRC_URI="http://coreos-build.smilart.com/binary/skydns/skydns-2.2.1a.tar.bz2"

src_install() {
   default
   dosbin skydns
   systemd_dounit "${FILESDIR}"/skydns.service
}

src_compile() {
   return
}
