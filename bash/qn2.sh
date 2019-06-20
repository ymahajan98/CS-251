#!/bin/bash
recurse(){
if [[ -f "$1" ]]; then
j=0
while [[ $j -ne $2 ]]; do
echo -n "     "
j=$(($j+1))
done
echo -n "(F) $1"
local w1=0
local c1=0
local w3=$(grep -Eow '[0-9]+' $1 | wc -l)
w3=$(($w3-$(grep -Eo '[0-9]+[.][0-9]+' $1 | wc -l)))
w3=$(($w3-$(grep -Eo '[0-9]+[.][0-9]+' $1 | wc -l)))
w1=$w3
local c3=$(grep -Eo '[!]' $1 | wc -l)
c3=$(($c3+$(grep -Eo '[?]' $1 | wc -l)))
c3=$(($c3+$(grep -Eo '[.]' $1 | wc -l)))
c3=$(($c3-$(grep -Eo '[0-9]+[.][0-9]+' $1 | wc -l)))
c1=$c3
echo -n "-$c1"
echo "-$w1"
words=$w1
count=$c1
elif [[ -d "$1" ]]; then
cd $1
local ind=$2
local w1=0
local c1=0
for d in *; do
recurse $d $(($ind+1))
w1=$(($w1+$words))
c1=$(($c1+$count))
done
cd ..
j=0
while [[ $j -ne $2 ]]; do
echo -n "     "
j=$(($j+1))
done
echo -n "(D) $1"
echo -n "-$c1"
echo "-$w1"
words=$w1
count=$c1
fi
}
words=0
count=0
echo "Give input"
read input
indent=0
if [[ -f "$input" || -d "$input" ]]; then
recurse $input $indent
else
echo "invalid input"
fi
