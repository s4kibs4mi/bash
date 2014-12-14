#!/bin/bash

function isPrime(){
    flag=0
    p=$1
    for((x = 2; x <= p/2; x++))
    do
        if [ $((p%x)) -eq 0 ]; then
            flag=1
            break
        fi
    done
    echo $flag
}

read n

sum=0
for((i = 2; i <= n/2; i++))
do
if [ $((n%i)) -eq 0 ] && [ $(isPrime $* $i) -eq 0 ]; then
        sum=$((sum+i))
        echo -n $i " "
    fi
done
echo
echo $sum
