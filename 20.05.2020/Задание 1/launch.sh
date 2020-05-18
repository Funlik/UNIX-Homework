#!/bin/bash
cd build
scp wgetdemo mobile@Nikolays-iPhone.lan:
ssh mobile@Nikolays-iPhone.lan "chmod +x wgetdemo; ./wgetdemo; cat test.txt"
