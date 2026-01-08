#!/bin/bash

read -p "enter the size of an array:" num
arr=()
for((i=0;i<num;i++))
do
	read n
	arr[$i]=$n
done

echo "the array elements are: ${arr[@]}"
