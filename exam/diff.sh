#!/bin/bash
last=$(ls .myvcs/files/ | sort -n | tail -1)
cp -R .myvcs/origfiles .myvcs/tmp
for p in $(ls .myvcs/files/ | sort -n)
do
	patch -s -p0 -d".myvcs/tmp" < ".myvcs/files/$p"
done
diff -ruN .myvcs/tmp . -x '.myvcs'
rm -rf .myvcs/tmp