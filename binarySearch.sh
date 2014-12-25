#!/bin/bash

read key

x=0
for i in $*
do
	elements[$x]=$i
	((x++))
done

# Sorting data using selection sort
for((i = 0; i < x; i++))
do
	min=$i
	for((j = i+1; j < x; j++))
	do
		if (( elements[$j] < elements[$min] )); then
			min=$j
		fi
	done
	temp=${elements[$i]}
	elements[$i]=${elements[$min]}
	elements[$min]=$temp
done

echo "Sorted array :" ${elements[*]}
echo  "Key =" $key

# Searching data using binary search
found=0
left=0
while [ $left -le $x ]
do
	mid=$(((left+x)/2))
	if (( elements[mid] == key )); then
		found=1
		break
	elif (( elements[mid] > key )); then
		x=$((mid-1))
	else
		left=$((mid+1))
	fi
done

if [ $found -eq 1 ]; then
	echo "Key found"
else
	echo "Key not found"
fi
