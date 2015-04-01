
EAPI="5"

SLOT="0"

DESCRIPTION="Kernel sources"
HOMEPAGE="http://smilart.com"
SRC_URI="https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.6.tar.xz"

LICENSE="MIT"
KEYWORDS="amd64"
#src_unpack() {
#   return
#}


src_install() {
   dodir /usr/sources
   cp -L  "${DISTDIR}/linux-3.18.6.tar.xz" "${D}/usr/sources" || die "Install failed!"
}

src_compile() {
   return
}
