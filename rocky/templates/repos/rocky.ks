# Setup repos
repo --name=Rocky-AppStream --mirrorlist=https://mirrors.rockylinux.org/mirrorlist?repo=rocky-AppStream-$releasever&arch=$basearch
repo --name=Rocky-BaseOS --mirrorlist=https://mirrors.rockylinux.org/mirrorlist?repo=rocky-BaseOS-$releasever&arch=$basearch
url --mirrorlist=https://mirrors.rockylinux.org/mirrorlist?repo=rocky-BaseOS-$releasever&arch=$basearch
