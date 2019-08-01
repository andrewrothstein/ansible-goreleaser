#!/usr/bin/env sh
VER=v0.113.1
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
    OS=$1
    ARCH=$2
    SUFFIX=$3
    FILE=goreleaser_${OS}_${ARCH}.${SUFFIX}
    URL=$MIRROR/$FILE

    printf "    # %s\n" $URL
    printf "    %s_%s: sha256:%s\n" $OS $ARCH `fgrep $FILE $LSHASUMS | awk '{print $1}'`
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

