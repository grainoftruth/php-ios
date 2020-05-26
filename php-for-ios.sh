#!/bin/bash

PLATFORM=iPhoneOS # iPhoneSimulator # iPhoneOS
HOST=arm-apple-darwin # i386-apple-darwin10 # arm-apple-darwin10
ARCH=arm64 # i386 # armv7s #armv7
SDK_VERSION=13.5

XCODE_ROOT=`xcode-select -print-path`
PLATFORM_PATH=$XCODE_ROOT/Platforms/$PLATFORM.platform/Developer
SDK_PATH=$PLATFORM_PATH/SDKs/$PLATFORM$SDK_VERSION.sdk
FLAGS="-isysroot $SDK_PATH -arch $ARCH -miphoneos-version-min=$SDK_VERSION"
PLATFORM_BIN_PATH=$XCODE_ROOT/Toolchains/XcodeDefault.xctoolchain/usr/bin
CC=/usr/bin/clang
CXX=/usr/bin/clang++
CFLAGS="$FLAGS -std=gnu99"
CXXFLAGS="$FLAGS -std=gnu++11 -stdlib=libc++"
LDFLAGS=$FLAGS

export CC CXX CFLAGS CXXFLAGS LDFLAGS

CONFIGURE_FLAGS="--host=$HOST --enable-embed=static --disable-phpdbg --enable-static --without-pear --disable-opcache --without-iconv --disable-cgi --disable-shared --enable-mysqlnd --with-pdo-mysql --with-mysqli --with-tsrm-pthreads --with-pcre-jit=no"
./configure $CONFIGURE_FLAGS
make