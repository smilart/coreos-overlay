
EAPI="5"

SLOT="0"

DESCRIPTION="Kernel sources"
HOMEPAGE="http://smilart.com"
SRC_URI="https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.0.1.tar.xz"

LICENSE="MIT"
KEYWORDS="amd64"
#src_unpack() {
#   return
#}


src_install() {
   dodir /usr/sources
   cp -L  "${DISTDIR}/linux-4.0.1.tar.xz" "${D}/usr/sources" || die "Install failed!"
}

src_compile() {
   return
}
