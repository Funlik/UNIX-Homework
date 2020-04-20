#!/bin/bash

if [ -z $1 ]
 then 
 	echo "usage: counter.sh file"
 exit
fi

while read LINE; 
do
    for s in $LINE; 
    do
        ((words++))
        if [[ "$s" == *['!.'] ]]; then
        	((sentences[$words]++))
        	words=0
        fi
    done
done < $1 

for i in ${!sentences[@]}
do
	if [ "$i" -gt 0 ] && [ "$i" -lt 11 ]; then #for 1-10 numbers
		echo $i "word(s) in sentence:" ${sentences[$i]}
	fi
done
