#!/bin/bash

read n < /home/s4kib/Lotus/in.txt # path to input file

check=true
counter=0

summation=0
maximum=0
integer=0

while [ $counter -lt $n ]
do
	read line

	if [ "$check" = true ]; then
		check=false		
		continue
	elif [ "$line" = "SUM" ]; then
		echo "Summation : $summation"
	elif [ "$line" = "AVG" ]; then
		average=`expr $summation / $integer`
		echo "Average : $average"
	elif [ "$line" = "MAX" ]; then
		echo "Maximum : $maximum"
	else
		echo $line
		summation=`expr $summation + $line`
		integer=`expr $integer + 1`

		if [ $maximum -lt $line ]; then
			maximum=$line
		fi
		
	fi

	counter=`expr $counter + 1`
done < /home/s4kib/Lotus/in.txt # path to input file
