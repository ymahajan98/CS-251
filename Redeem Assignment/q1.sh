#!/bin/bash
IFS=$'\n'
file="$1"
dir=0
fil=0
name1=0
size=0
while IFS= read -r line ; do
    if echo "$line" | grep -q "<dir>" ;then
    		dir=1
    elif echo "$line" | grep -q "</dir>" ;then
    		cd ..
    elif  echo "$line" | grep -q "<name>" ;then
		if [[ $fil -eq 1 ]];then
		emails=($(echo "$line" | grep -oP '(?<=name>)[^<]+'))
		emails="$(echo -e "${emails}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
		name1=$emails
		else
		emails=($(echo "$line" | grep -oP '(?<=name>)[^<]+'))
		emails="$(echo -e "${emails}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
		mkdir "$emails"
		cd "$emails"
		dir=0
		fi
    elif echo "$line" | grep -q "<size>" ;then
		emails=($(echo "$line" | grep -oP '(?<=size>)[^<]+'))
		emails="$(echo -e "${emails}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
		size=$emails
		truncate -s $size $name1
    elif echo "$line" | grep -q "<file>" ;then
		fil=1
    elif echo "$line" | grep -q "</file>";then
		fil=0
    fi
done <"$file"
