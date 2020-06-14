#!/bin/bash
last=$(ls .myvcs/files/ | sort -n | tail -1)
rm -rf ./*
if [ $1 -eq 0 ]
then
	cp -R .myvcs/origfiles/* .
	exit
fi
if [ $1 -gt $last ]
then
	ll=$last
else
	ll=$1
fi
cp -R .myvcs/origfiles .myvcs/tmp
for (( i=1; i<=$ll; i++ ))
do
	patch -s -p0 -d".myvcs/tmp" < ".myvcs/files/$i"
done
cp -R .myvcs/tmp/* .
rm -rf .myvcs/tmp
rm -f .myvcs/excluded