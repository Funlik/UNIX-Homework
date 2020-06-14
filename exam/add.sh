#!/bin/bash
if [ ! -e .myvcs/excluded ]
then
	echo ".myvcs" > .myvcs/excluded
	tree -afiF --noreport . | grep -v '/$' | grep -v '^.$' | grep -v '^./.myvcs/' | cut -c3- >> .myvcs/excluded
fi
for file in "$@"
do
	if [ -d "$file" ]
	then
		exc=$(tree -afiF --noreport "$file" | grep -v "^$file$")
		exc=$(echo "$exc" | sed 's/\//\\\//g')
		for dir in $exc
		do	
  		sed -i "/$dir/d" ".myvcs/excluded"
		done
	else
		sed -i "/$file/d" ".myvcs/excluded"
	fi
done