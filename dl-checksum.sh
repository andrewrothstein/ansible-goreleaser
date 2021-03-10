#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/goreleaser/goreleaser/releases/download

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local suffix=$5
    local platform="${os}_${arch}"
    local file=goreleaser_${platform}.${suffix}
    local url=$MIRROR/$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $lchecksums | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    local rchecksums=$MIRROR/$ver/goreleaser_checksums.txt
    local lchecksums=$DIR/goreleaser_${ver}_checksums.txt

    if [ ! -e $lchecksums ];
    then
        wget -q -O $lchecksums $rchecksums
    fi

    printf "  %s:\n" $ver
    dl $ver $lchecksums Darwin x86_64 tar.gz
    dl $ver $lchecksums Linux arm64 tar.gz
    dl $ver $lchecksums Linux armv6 tar.gz
    dl $ver $lchecksums Linux i386 tar.gz
    dl $ver $lchecksums Linux x86_64 tar.gz
    dl $ver $lchecksums Windows i386 zip
    dl $ver $lchecksums Windows x86_64 zip
}

dl_ver ${1:-v0.159.0}
