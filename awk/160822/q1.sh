#!/bin/bash
IFS=$'\n'
recurse(){
if [[ -f "$1" ]]; then
    if [[ $1 == *.c ]]; then
        string=$( awk -f q1.awk $1)
     local com1=$(echo $string | cut -d " " -f 2)
     local str1=$(echo $string | cut -d " " -f 1)
     com=$(($com+$com1))
      str=$(($str+$str1))
    fi
elif [[ -d "$1" ]]; then
    for d in $(ls "$1"); do
        k="$1/$d"
        recurse $k
    done
fi
}
com=0
str=0
recurse $1
echo $com "lines of comments"
echo $str "quoted strings"
