#!/bin/bash
mkdir build
cd build
mkdir ios
cd ios
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../../cmake/iphoneos.toolchain.cmake ../..
make
codesign -fs- --entitlements ../../hello.entitlements hello
cd ..
mkdir windows
cd windows
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../../cmake/windows.toolchain.cmake ../..
make
cd ..
mkdir currentos
cd currentos/
cmake ../..
make