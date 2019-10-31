#!/usr/bin/env sh
VER=${1:-v0.120.4}
DIR=~/Downloads
MIRROR=https://github.com/goreleaser/goreleaser/releases/download/$VER

RSHASUMS=$MIRROR/goreleaser_checksums.txt
LSHASUMS=$DIR/goreleaser_${VER}_checksums.txt

if [ ! -e $LSHASUMS ]
then
    wget -q -O $LSHASUMS $RSHASUMS
fi

dl()
{
    local os=$1
    local arch=$2
    local suffix=$3
    local platform="${os}_${arch}"
    local file=goreleaser_${platform}.${suffix}
    local url=$MIRROR/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $LSHASUMS | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl Darwin i386 tar.gz
dl Darwin x86_64 tar.gz
dl Linux arm64 tar.gz
dl Linux armv6 tar.gz
dl Linux i386 tar.gz
dl Linux x86_64 tar.gz
dl Windows i386 zip
dl Windows x86_64 zip

