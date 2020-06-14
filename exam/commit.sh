#!/bin/bash
if [ ! -e ".myvcs/excluded" ]
then
	echo "Nothing to commit"
	exit
fi
last=$(ls .myvcs/files/ | sort -n | tail -1)
if [ -z "$last" ]
then
	commit=1
else
	commit=$(expr $last + 1)
fi
cp -R .myvcs/origfiles .myvcs/tmp
for p in $(ls .myvcs/files/ | sort -n)
do
	patch -s -p0 -d".myvcs/tmp" < ".myvcs/files/$p"
done
diff -ruN .myvcs/tmp . -X .myvcs/excluded > ".myvcs/files/$commit"
rm -rf .myvcs/tmp
rm .myvcs/excluded