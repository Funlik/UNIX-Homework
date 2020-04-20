#!/bin/bash

# * Напишите скрипт, который проанализирует некий файл и выдаст на экран статистику по количеству слов в предложениях этого текстового файла.
# Статистика нужна по предложениям от 1 до 10 слов.
# script.sh voina_i_mir.txt
# 1 word in sentence: 2346
# 2 word in sentence: 5634
# ......
# Разделителями считать точки и восклицательные знаки.

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
