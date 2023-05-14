#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/goreleaser/goreleaser/releases/download

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local suffix=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file=goreleaser_${platform}.${suffix}
    local url=$MIRROR/$ver/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep -e "$file\$" $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    # https://github.com/goreleaser/goreleaser/releases/download/v0.178.0/checksums.txt
    local rchecksums=$MIRROR/$ver/checksums.txt
    local lchecksums=$DIR/goreleaser_${ver}_checksums.txt

    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $rchecksums
    fi

    printf "  # %s\n" $rchecksums
    printf "  %s:\n" $ver
    dl $ver $lchecksums Darwin arm64
    dl $ver $lchecksums Darwin x86_64
    dl $ver $lchecksums Linux arm64
    dl $ver $lchecksums Linux armv7
    dl $ver $lchecksums Linux i386
    dl $ver $lchecksums Linux x86_64
    dl $ver $lchecksums Windows arm64 zip
    dl $ver $lchecksums Windows i386 zip
    dl $ver $lchecksums Windows x86_64 zip
}

dl_ver ${1:-v1.18.2}
