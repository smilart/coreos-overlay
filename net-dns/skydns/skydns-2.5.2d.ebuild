EAPI="5"

SLOT="0"

inherit systemd.

DESCRIPTION="SkyDNS is a distributed service for announcement and discovery of services built on top of etcd."
HOMEPAGE="https://github.com/skynetservices/skydns"
SRC_URI=https://github.com/skynetservices/skydns/archive/2.5.2d.tar.gz

LICENSE="MIT"
KEYWORDS="amd64"

DEPEND="dev-lang/go"

export GOPATH="${D}"
export GOBIN="${D}/bin"

src_prepare() {
#get dependencies
    go get || die "Error in go get command"
}
src_compile() {
    go build -v ||die "Error in go build"
}

src_install() {
    newsbin skydns-${PV} skydns
    systemd_dounit "${FILESDIR}"/skydns.service
    systemd_enable_service multi-user.target skydns.service
}

