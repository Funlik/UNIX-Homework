#!/bin/bash

if [ -z $1 ]
 then 
 	echo "usage: jokes.sh file"
 exit
fi

RANDBASHNUMBER=$(curl -s https://bash.im/forweb/?u | \
        sed -n 's/.*\/quote\/\([0-9]*\)".*/\1/p')

if ! [[ "$RANDBASHNUMBER" =~ ^[0-9]+$ ]]    
then
	echo "Can't reach bash.org\n"
	JOKE=$(shuf -n 1 $1)
	if [ -z "$JOKE" ]
	then
		echo "Error reading the locally stored jokes"
		exit
	fi
else
	JOKE=$(curl -s https://bash.im/quote/$RANDBASHNUMBER | \
	        grep 'meta property="og:description"' | \
	        sed 's/      <meta property="og:description" content="//' | \
	        sed 's!" />!!' | sed 's/\&lt;/</g' | sed 's/\&gt;/>/g' |\
	        sed 's/\&quot;/"/g')
	      
	if ! grep -Fxq "$JOKE" $1
	then
		echo $JOKE >> $1
	fi
fi
echo "$JOKE" | sed 's/\&#13;&#10;/\r\n/g'
