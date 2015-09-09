
EAPI="5"

SLOT="0"

inherit systemd git-2

DESCRIPTION="SkyDNS is a distributed service for announcement and discovery of services built on top of etcd."
HOMEPAGE="https://github.com/skynetservices/skydns"

LICENSE="MIT"
KEYWORDS="amd64"

EGIT_REPO_URI="git://github.com/skynetservices/skydns.git"
EGIT_COMMIT="2.5.2d"
EGIT_SOURCEDIR="${S}"

DEPEND="dev-lang/go"

export GOPATH="${EGIT_SOURCEDIR}"
export GOBIN="${GOPATH}/bin"

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

