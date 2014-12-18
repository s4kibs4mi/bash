#!/bin/bash

read n
for((i = 1; i <= n; i++))
do
    for((j = 1; j <= n-i; j++))
    do
        echo -n " "
    done

    for((j = i; j >= 1; j--))
    do
        echo -n $j
    done

    for((j = 2; j <= i; j++))
    do
        echo -n $j
    done
    echo ""
done

for((i = 1; i <= n; i++))
do
    for((j = 1; j <= i; j++))
    do
        echo -n " "
    done

    for((j = n-i; j >= 1; j--))
    do
        echo -n $j
    done

    for((j = 2; j <= n-i; j++))
    do
        echo -n $j
    done
    echo ""
done
