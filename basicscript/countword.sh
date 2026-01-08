#!/bin/bash

read -p "enter the full file path:" file
if [[ ! -f "$file" ]]
then
	echo "$file does not exist"
	exit 1
fi
word=$(wc -l "$file"| cut -d " " -f1)
echo "$word"
