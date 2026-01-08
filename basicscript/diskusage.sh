#!/bin/bash
read -p "enter the threshold:" threshold
percent=$(df / | awk 'NR==2 {print $5}' | sed 's/%/ /g')
if [[ "$percent" -lt "$threshold" ]]
then
	echo "diskusage is less than $threshold"
else
	echo "diskusage is greaterthan $threshold"
fi
