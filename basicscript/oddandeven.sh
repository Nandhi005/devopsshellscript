#!/bin/bash

echo "when you run this script pass the values as scriptname   1 2 3 in this format"
for i in "$@"
do
	if (( i % 2 == 0 ))
	then
		echo "$i is even"
	else
		echo "$i is odd"
	fi
done
