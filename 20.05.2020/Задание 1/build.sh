#!/bin/bash
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../cmake/iphoneos.toolchain.cmake ..
make
codesign -fs- --entitlements ../wgetdemo.entitlements wgetdemo