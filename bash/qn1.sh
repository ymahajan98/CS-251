#!/bin/bash
single1(){
case $1 in
       0) echo -n  "" ;;
        1) echo -n  "one thousand " ;;
        2) echo -n  "two thousand " ;;
        3) echo -n  "three thousand " ;;
        4) echo -n  "four thousand " ;;
        5) echo -n  "five thousand " ;;
        6) echo -n  "six thousand " ;;
        7) echo  -n "seven thousand " ;;
        8) echo -n  "eight thousand " ;;
        9) echo -n  "nine thousand " ;;
    esac }
single2(){
case $1 in
       0) echo -n  "" ;;
        1) echo -n  "one hundred " ;;
        2) echo -n  "two hundred " ;;
        3) echo -n  "three hundred " ;;
        4) echo -n  "four hundred " ;;
        5) echo -n  "five hundred " ;;
        6) echo -n  "six hundred " ;;
        7) echo  -n "seven hundred " ;;
        8) echo -n  "eight hundred " ;;
        9) echo -n  "nine hundred " ;;
    esac }
single3(){
case $1 in
       0) echo -n  "" ;;
        1) echo -n  "one " ;;
        2) echo -n  "two " ;;
        3) echo -n  "three " ;;
        4) echo -n  "four " ;;
        5) echo -n  "five " ;;
        6) echo -n  "six " ;;
        7) echo  -n "seven " ;;
        8) echo -n  "eight " ;;
        9) echo -n  "nine " ;;
    esac }
single4(){
case $1 in
       0) echo -n  "ten " ;;
        1) echo -n  "eleven " ;;
        2) echo -n  "twelve " ;;
        3) echo -n  "thirteen " ;;
        4) echo -n  "fourteen " ;;
        5) echo -n  "fifteen " ;;
        6) echo -n  "sixteen " ;;
        7) echo  -n "seventeen " ;;
        8) echo -n  "eighteen " ;;
        9) echo -n  "nineteen " ;;
    esac }
single5(){
case $1 in
       0) echo -n  "" ;;
        1) echo -n  "" ;;
        2) echo -n  "twenty " ;;
        3) echo -n  "thirty " ;;
        4) echo -n  "fourty " ;;
        5) echo -n  "fifty " ;;
        6) echo -n  "sixty " ;;
        7) echo  -n "seventy " ;;
        8) echo -n  "eighty " ;;
        9) echo -n  "ninety " ;;
    esac }

echo "Give input-"
read n
c=${#n}
if  [[ $n =~ ^[0-9]{$c}$ ]]; then
	if [[ $n =~ ^[0]{$c}$ ]]; then
        echo zero
	else
		n=$(echo $n | sed 's/^0*//') 
		i=0
		m=$n
        	k=${#m}
		if [[ $k -ge 12 ]]; then
		echo invalid input
		exit
		fi
		if [[ $k -eq 11 ]]; then
		single1 ${m:0:1}
		fi
		if [[ $k -ge 10 ]]; then
                single2 ${m:$k-11+1:1}
                fi
		if [[ $k -ge 8 ]]; then
			if [[ $k -eq 8 ]]; then
			single3 ${m:$k-11+3:1}
			echo -n "crore "
			else
	       			 if [[ ${m:$k-11+2:1} -eq 0 ]]; then
				 single3 ${m:$k-11+3:1}
				echo -n "crore "
				 elif [[ ${m:$k-11+2:1} -eq 1 ]]; then
				 single4 ${m:$k-11+3:1}
				 echo -n "crore "
				 else  
				 single5 ${m:$k-11+2:1}
				 single3 ${m:$k-11+3:1}
				 echo -n "crore "
				 fi
			fi
                fi
                if [[ $k -ge 6 ]]; then
	                if [[ $k -eq 6 ]]; then
                        single3 ${m:$k-11+5:1}
			echo -n "lakh "
                        else
                                 if [[ ${m:$k-11+4:1} -eq 0 ]]; then
                                 single3 ${m:$k-11+5:1}
				echo -n "lakh "
                                 elif [[ ${m:$k-11+4:1} -eq 1 ]]; then
                                 single4 ${m:$k-11+5:1}
                                 echo -n "lakh "
                                 else
                                 single5 ${m:$k-11+4:1}
                                 single3 ${m:$k-11+5:1}
				 echo -n "lakh "
                                 fi
                        fi

                fi
		if [[ $k -ge 4 ]]; then
                        if [[ $k -eq 4 ]]; then
                        single3 ${m:$k-11+7:1}
                        echo -n "thousand "
                        else
                                 if [[ ${m:$k-11+7:1} -eq 0 ]]; then
                                 single3 ${m:$k-11+7:1}
                                echo -n "thousand "
                                 elif [[ ${m:$k-11+6:1} -eq 1 ]]; then
                                 single4 ${m:$k-11+7:1}
                                 echo -n "thousand "
                                 else
                                 single5 ${m:$k-11+6:1}
                                 single3 ${m:$k-11+7:1}
                                 echo -n "thousand "
                                 fi
                        fi

                fi
		if [[ $k -ge 3 ]]; then
		single2 ${m:$k-11+8:1}
		fi
		if [[ $k -ge 1 ]]; then
                        if [[ $k -eq 1 ]]; then
                        single3 ${m:$k-11+10:1}
                        else
                                 if [[ ${m:$k-11+10:1} -eq 0 ]]; then
                                 single3 ${m:$k-11+9:1}
                                 elif [[ ${m:$k-11+9:1} -eq 1 ]]; then
                                 single4 ${m:$k-11+10:1}
                                 else
                                 single5 ${m:$k-11+9:1}
                                 single3 ${m:$k-11+10:1}
                                 fi
                        fi

                fi

	fi
else
	echo "invalid input"
fi
