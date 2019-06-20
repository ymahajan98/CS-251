#!/bin/bash
bc=$(<params.txt)
cd=$(<threads.txt)
k=1
for i in $cd; do
    for j in $bc; do
        for value in {1..100};do
            echo -n $j $i ""
            ./thread.ex1 $j $i
        done
    done
done
