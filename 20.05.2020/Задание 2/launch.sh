#!/bin/bash
cd build/ios
scp hello mobile@Nikolays-iPhone.lan:
ssh mobile@Nikolays-iPhone.lan "chmod +x hello; ./hello"
cd ../windows
wine hello.exe 2>/dev/null
cd ../currentos
chmod +x hello
./hello