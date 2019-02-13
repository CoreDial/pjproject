#!/bin/sh
#main build logic borrowed from https://github.com/petester42/pjsip-ios/blob/master/build.sh
#Updated to build using XCode 9.3

mkdir Pod
mkdir Pod/pjsip-include
mkdir Pod/pjsip-lib

# see http://stackoverflow.com/a/3915420/318790
function realpath { echo $(cd $(dirname "$1"); pwd)/$(basename "$1"); }

LOGS_DIR=$(realpath "logs")
if [ ! -d ${LOGS_DIR} ]; then
    mkdir ${LOGS_DIR}
fi

copy_libs () {
    DST=${1}

    if [ -d pjlib/lib-${DST}/ ]; then
        rm -rf pjlib/lib-${DST}/
    fi
    if [ ! -d pjlib/lib-${DST}/ ]; then
        mkdir pjlib/lib-${DST}/
    fi
    cp pjlib/lib/libpj-${DST}-apple-darwin_ios.a pjlib/lib-${DST}/libpj-arm-apple-darwin_ios.a

    if [ -d pjlib-util/lib-${DST}/ ]; then
        rm -rf pjlib-util/lib-${DST}/
    fi
    if [ ! -d pjlib-util/lib-${DST}/ ]; then
        mkdir pjlib-util/lib-${DST}/
    fi
    cp pjlib-util/lib/libpjlib-util-${DST}-apple-darwin_ios.a pjlib-util/lib-${DST}/libpjlib-util-arm-apple-darwin_ios.a

    if [ -d pjmedia/lib-${DST}/ ]; then
        rm -rf pjmedia/lib-${DST}/
    fi
    if [ ! -d pjmedia/lib-${DST}/ ]; then
        mkdir pjmedia/lib-${DST}/
    fi
    cp pjmedia/lib/libpjmedia-${DST}-apple-darwin_ios.a pjmedia/lib-${DST}/libpjmedia-arm-apple-darwin_ios.a
    cp pjmedia/lib/libpjmedia-audiodev-${DST}-apple-darwin_ios.a pjmedia/lib-${DST}/libpjmedia-audiodev-arm-apple-darwin_ios.a
    cp pjmedia/lib/libpjmedia-codec-${DST}-apple-darwin_ios.a pjmedia/lib-${DST}/libpjmedia-codec-arm-apple-darwin_ios.a
    cp pjmedia/lib/libpjmedia-videodev-${DST}-apple-darwin_ios.a pjmedia/lib-${DST}/libpjmedia-videodev-arm-apple-darwin_ios.a
    cp pjmedia/lib/libpjsdp-${DST}-apple-darwin_ios.a pjmedia/lib-${DST}/libpjsdp-arm-apple-darwin_ios.a

    if [ -d pjnath/lib-${DST}/ ]; then
        rm -rf pjnath/lib-${DST}/
    fi
    if [ ! -d pjnath/lib-${DST}/ ]; then
        mkdir pjnath/lib-${DST}/
    fi
    cp pjnath/lib/libpjnath-${DST}-apple-darwin_ios.a pjnath/lib-${DST}/libpjnath-arm-apple-darwin_ios.a

    if [ -d pjsip/lib-${DST}/ ]; then
        rm -rf pjsip/lib-${DST}/
    fi
    if [ ! -d pjsip/lib-${DST}/ ]; then
        mkdir pjsip/lib-${DST}/
    fi
    cp pjsip/lib/libpjsip-${DST}-apple-darwin_ios.a pjsip/lib-${DST}/libpjsip-arm-apple-darwin_ios.a
    cp pjsip/lib/libpjsip-simple-${DST}-apple-darwin_ios.a pjsip/lib-${DST}/libpjsip-simple-arm-apple-darwin_ios.a
    cp pjsip/lib/libpjsip-ua-${DST}-apple-darwin_ios.a pjsip/lib-${DST}/libpjsip-ua-arm-apple-darwin_ios.a
    cp pjsip/lib/libpjsua-${DST}-apple-darwin_ios.a pjsip/lib-${DST}/libpjsua-arm-apple-darwin_ios.a
    cp pjsip/lib/libpjsua2-${DST}-apple-darwin_ios.a pjsip/lib-${DST}/libpjsua2-arm-apple-darwin_ios.a

    if [ -d third_party/lib-${DST}/ ]; then
        rm -rf third_party/lib-${DST}/
    fi
    if [ ! -d third_party/lib-${DST}/ ]; then
        mkdir third_party/lib-${DST}/
    fi
    cp third_party/lib/libg7221codec-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libg7221codec-arm-apple-darwin_ios.a
    cp third_party/lib/libgsmcodec-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libgsmcodec-arm-apple-darwin_ios.a
    cp third_party/lib/libilbccodec-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libilbccodec-arm-apple-darwin_ios.a
    cp third_party/lib/libresample-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libresample-arm-apple-darwin_ios.a
    cp third_party/lib/libspeex-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libspeex-arm-apple-darwin_ios.a
    cp third_party/lib/libsrtp-${DST}-apple-darwin_ios.a third_party/lib-${DST}/libsrtp-arm-apple-darwin_ios.a
}

lipo_libs () {
xcrun -sdk iphoneos lipo -arch i386   pjlib/lib-i386/libpj-arm-apple-darwin_ios.a \
                         -arch x86_64 pjlib/lib-x86_64/libpj-arm-apple-darwin_ios.a \
                         -arch armv7  pjlib/lib-armv7/libpj-arm-apple-darwin_ios.a \
                         -arch armv7s pjlib/lib-armv7s/libpj-arm-apple-darwin_ios.a \
                         -arch arm64  pjlib/lib-arm64/libpj-arm-apple-darwin_ios.a \
                         -create -output lib/libpj-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjlib-util/lib-i386/libpjlib-util-arm-apple-darwin_ios.a \
                         -arch x86_64 pjlib-util/lib-x86_64/libpjlib-util-arm-apple-darwin_ios.a \
                         -arch armv7  pjlib-util/lib-armv7/libpjlib-util-arm-apple-darwin_ios.a \
                         -arch armv7s pjlib-util/lib-armv7s/libpjlib-util-arm-apple-darwin_ios.a \
                         -arch arm64  pjlib-util/lib-arm64/libpjlib-util-arm-apple-darwin_ios.a \
                         -create -output lib/libpjlib-util-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjmedia/lib-i386/libpjmedia-arm-apple-darwin_ios.a \
                         -arch x86_64 pjmedia/lib-x86_64/libpjmedia-arm-apple-darwin_ios.a \
                         -arch armv7  pjmedia/lib-armv7/libpjmedia-arm-apple-darwin_ios.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-arm-apple-darwin_ios.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-arm-apple-darwin_ios.a \
                         -create -output lib/libpjmedia-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjmedia/lib-i386/libpjmedia-audiodev-arm-apple-darwin_ios.a \
                         -arch x86_64 pjmedia/lib-x86_64/libpjmedia-audiodev-arm-apple-darwin_ios.a \
                         -arch armv7  pjmedia/lib-armv7/libpjmedia-audiodev-arm-apple-darwin_ios.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-audiodev-arm-apple-darwin_ios.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-audiodev-arm-apple-darwin_ios.a \
                         -create -output lib/libpjmedia-audiodev-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjmedia/lib-i386/libpjmedia-codec-arm-apple-darwin_ios.a \
                         -arch x86_64 pjmedia/lib-x86_64/libpjmedia-codec-arm-apple-darwin_ios.a \
                         -arch armv7  pjmedia/lib-armv7/libpjmedia-codec-arm-apple-darwin_ios.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-codec-arm-apple-darwin_ios.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-codec-arm-apple-darwin_ios.a \
                         -create -output lib/libpjmedia-codec-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjmedia/lib-i386/libpjmedia-videodev-arm-apple-darwin_ios.a \
                         -arch x86_64 pjmedia/lib-x86_64/libpjmedia-videodev-arm-apple-darwin_ios.a \
                         -arch armv7  pjmedia/lib-armv7/libpjmedia-videodev-arm-apple-darwin_ios.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-videodev-arm-apple-darwin_ios.a \
                         -arch arm64 pjmedia/lib-arm64/libpjmedia-videodev-arm-apple-darwin_ios.a \
                         -create -output lib/libpjmedia-videodev-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjmedia/lib-i386/libpjsdp-arm-apple-darwin_ios.a \
                         -arch x86_64 pjmedia/lib-x86_64/libpjsdp-arm-apple-darwin_ios.a \
                         -arch armv7  pjmedia/lib-armv7/libpjsdp-arm-apple-darwin_ios.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjsdp-arm-apple-darwin_ios.a \
                         -arch arm64  pjmedia/lib-arm64/libpjsdp-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsdp-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjnath/lib-i386/libpjnath-arm-apple-darwin_ios.a \
                         -arch x86_64 pjnath/lib-x86_64/libpjnath-arm-apple-darwin_ios.a \
                         -arch armv7  pjnath/lib-armv7/libpjnath-arm-apple-darwin_ios.a \
                         -arch armv7s pjnath/lib-armv7s/libpjnath-arm-apple-darwin_ios.a \
                         -arch arm64  pjnath/lib-arm64/libpjnath-arm-apple-darwin_ios.a \
                         -create -output lib/libpjnath-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjsip/lib-i386/libpjsip-arm-apple-darwin_ios.a \
                         -arch x86_64 pjsip/lib-x86_64/libpjsip-arm-apple-darwin_ios.a \
                         -arch armv7  pjsip/lib-armv7/libpjsip-arm-apple-darwin_ios.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-arm-apple-darwin_ios.a \
                         -arch arm64 pjsip/lib-arm64/libpjsip-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsip-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjsip/lib-i386/libpjsip-simple-arm-apple-darwin_ios.a \
                         -arch x86_64 pjsip/lib-x86_64/libpjsip-simple-arm-apple-darwin_ios.a \
                         -arch armv7  pjsip/lib-armv7/libpjsip-simple-arm-apple-darwin_ios.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-simple-arm-apple-darwin_ios.a \
                         -arch arm64  pjsip/lib-arm64/libpjsip-simple-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsip-simple-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjsip/lib-i386/libpjsip-ua-arm-apple-darwin_ios.a \
                         -arch x86_64 pjsip/lib-x86_64/libpjsip-ua-arm-apple-darwin_ios.a \
                         -arch armv7  pjsip/lib-armv7/libpjsip-ua-arm-apple-darwin_ios.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-ua-arm-apple-darwin_ios.a \
                         -arch arm64  pjsip/lib-arm64/libpjsip-ua-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsip-ua-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjsip/lib-i386/libpjsua-arm-apple-darwin_ios.a \
                         -arch x86_64 pjsip/lib-x86_64/libpjsua-arm-apple-darwin_ios.a \
                         -arch armv7  pjsip/lib-armv7/libpjsua-arm-apple-darwin_ios.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsua-arm-apple-darwin_ios.a \
                         -arch arm64  pjsip/lib-arm64/libpjsua-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsua-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   pjsip/lib-i386/libpjsua2-arm-apple-darwin_ios.a \
                         -arch x86_64 pjsip/lib-x86_64/libpjsua2-arm-apple-darwin_ios.a \
                         -arch armv7  pjsip/lib-armv7/libpjsua2-arm-apple-darwin_ios.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsua2-arm-apple-darwin_ios.a \
                         -arch arm64  pjsip/lib-arm64/libpjsua2-arm-apple-darwin_ios.a \
                         -create -output lib/libpjsua2-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libg7221codec-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libg7221codec-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libg7221codec-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libg7221codec-arm-apple-darwin_ios.a \
                         -arch arm64  third_party/lib-arm64/libg7221codec-arm-apple-darwin_ios.a \
                         -create -output lib/libg7221codec-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libgsmcodec-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libgsmcodec-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libgsmcodec-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libgsmcodec-arm-apple-darwin_ios.a \
                         -arch arm64  third_party/lib-arm64/libgsmcodec-arm-apple-darwin_ios.a \
                         -create -output lib/libgsmcodec-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libilbccodec-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libilbccodec-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libilbccodec-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libilbccodec-arm-apple-darwin_ios.a \
                         -arch arm64  third_party/lib-arm64/libilbccodec-arm-apple-darwin_ios.a \
                         -create -output lib/libilbccodec-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libresample-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libresample-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libresample-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libresample-arm-apple-darwin_ios.a \
                         -arch arm64  third_party/lib-arm64/libresample-arm-apple-darwin_ios.a \
                         -create -output lib/libresample-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libspeex-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libspeex-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libspeex-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libspeex-arm-apple-darwin_ios.a \
                         -arch arm64 third_party/lib-arm64/libspeex-arm-apple-darwin_ios.a \
                         -create -output lib/libspeex-arm-apple-darwin_ios.a

xcrun -sdk iphoneos lipo -arch i386   third_party/lib-i386/libsrtp-arm-apple-darwin_ios.a \
                         -arch x86_64 third_party/lib-x86_64/libsrtp-arm-apple-darwin_ios.a \
                         -arch armv7  third_party/lib-armv7/libsrtp-arm-apple-darwin_ios.a \
                         -arch armv7s third_party/lib-armv7s/libsrtp-arm-apple-darwin_ios.a \
                         -arch arm64 third_party/lib-arm64/libsrtp-arm-apple-darwin_ios.a \
                         -create -output lib/libsrtp-arm-apple-darwin_ios.a
}


PJSIP_DIR=..

configure="./configure-iphone"

cd ${PJSIP_DIR}
echo "Working directory $PWD..."

# create directory for the universal libs
LIB_DIR=$(realpath "lib")
if [ ! -d ${LIB_DIR} ]; then
    mkdir ${LIB_DIR}
fi

function _build() {
  ARCH=$1
  LOG=${LOGS_DIR}/${ARCH}.log

  echo "Building for ${ARCH}..."

  make distclean > ${LOG} 2>&1
  ARCH="-arch ${ARCH}" ./configure-iphone >> ${LOG} 2>&1
  make dep >> ${LOG} 2>&1
  make clean >> ${LOG}
  make >> ${LOG} 2>&1

  copy_libs ${ARCH}
}

function armv7() { _build "armv7"; }
function armv7s() { _build "armv7s"; }
function arm64() { _build "arm64"; }
function i386() {
  export DEVPATH="`xcrun -sdk iphonesimulator --show-sdk-platform-path`/Developer"
  export CFLAGS="-I${OPENSSL_DIR}/include -O2 -m32 -mios-simulator-version-min=6.0"
  export LDFLAGS="-L${OPENSSL_DIR}/lib -O2 -m32 -mios-simulator-version-min=6.0"
  _build "i386"
}
function x86_64() {
  export DEVPATH="`xcrun -sdk iphonesimulator --show-sdk-platform-path`/Developer"
  export CFLAGS="-I${OPENSSL_DIR}/include -O2 -m32 -mios-simulator-version-min=6.0"
  export LDFLAGS="-L${OPENSSL_DIR}/lib -O2 -m32 -mios-simulator-version-min=6.0"
  _build "x86_64"
}

armv7 && armv7s && arm64 && i386 && x86_64

echo "Making universal lib..."
make distclean > /dev/null
lipo_libs

cd coredial
echo "Working directory $PWD..."

#copy libraries to pod lib dir
cp ../lib/* Pod/pjsip-lib/

#copy headers to pod include dir
cp -R ../*/include/* Pod/pjsip-include/

#delete any stale archives
rm pjsip-ios-cd-*.tar.gz
COPYFILE_DISABLE=1 tar -zcvf pjsip-ios-cd-1.0.0.tar.gz Pod/* LICENSE README.md *podspec

echo "Done"
