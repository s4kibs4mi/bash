#!/bin/bash

counter=0
for((i=2; i <= 900000000 && counter <= 5; i++))
do
    sum=0
    for((j = 1; j <= i/2; j++))
    do
        if [ $((i%j)) -eq 0 ]; then
            sum=$((sum+j))
        fi
    done
    if [ $sum -eq $i ]; then
        counter=$((counter+1))
        echo "# $counter Perfect Number " $i
    fi
done
