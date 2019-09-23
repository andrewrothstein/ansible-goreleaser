#!/usr/bin/env sh
VER=v0.118.0
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
    local file=goreleaser_${os}_${arch}.${suffix}
    local url=$MIRROR/$file

    printf "    # %s\n" $url
    printf "    %s_%s: sha256:%s\n" $os $arch `fgrep $file $LSHASUMS | awk '{print $1}'`
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

