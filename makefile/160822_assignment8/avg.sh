#!/bin/bash
awk '{ if (NR<=100) sum += $6; } END { if (NR > 0) print 1000,sum / 100 }' runtest
awk '{ if (NR>=101 &&  NR<=200) sum += $6; } END { if (NR > 0) print 10000,sum / 100 }' runtest
awk '{ if (NR>=201 && NR<=300) sum += $6; } END { if (NR > 0) print 100000,sum / 100 }' runtest
awk '{ if (NR>=301 && NR<=400) sum += $6; } END { if (NR > 0) print 1000000,sum / 100 }' runtest
awk '{ if (NR>=401 && NR<=500) sum += $6; } END { if (NR > 0) print 1000,sum / 100 }' runtest
awk '{ if (NR>=501 && NR<=600) sum += $6; } END { if (NR > 0) print 10000,sum / 100 }' runtest
awk '{ if (NR>=601 && NR<=700) sum += $6; } END { if (NR > 0) print 100000,sum / 100 }' runtest
awk '{ if (NR>=701 && NR<=800) sum += $6; } END { if (NR > 0) print 1000000,sum / 100 }' runtest
awk '{ if (NR>=801 && NR<=900) sum += $6; } END { if (NR > 0) print 1000,sum / 100 }' runtest
awk '{ if (NR>=901 && NR<=1000) sum += $6; } END { if (NR > 0) print 10000,sum / 100 }' runtest
awk '{ if (NR>=1001 && NR<=1100) sum += $6; } END { if (NR > 0) print 100000,sum / 100 }' runtest
awk '{ if (NR>=1101 && NR<=1200) sum += $6; } END { if (NR > 0) print 1000000,sum / 100 }' runtest
awk '{ if (NR>=1201 && NR<=1300) sum += $6; } END { if (NR > 0) print 1000,sum / 100 }' runtest
awk '{ if (NR>=1301 && NR<=1400) sum += $6; } END { if (NR > 0) print 10000,sum / 100 }' runtest
awk '{ if (NR>=1401 && NR<=1500) sum += $6; } END { if (NR > 0) print 100000,sum / 100 }' runtest
awk '{ if (NR>=1501 && NR<=1600) sum += $6; } END { if (NR > 0) print 1000000,sum / 100 }' runtest
awk '{ if (NR>=1601 && NR<=1700) sum += $6; } END { if (NR > 0) print 1000,sum / 100 }' runtest
awk '{ if (NR>=1701 && NR<=1800) sum += $6; } END { if (NR > 0) print 10000,sum / 100 }' runtest
awk '{ if (NR>=1801 && NR<=1900) sum += $6; } END { if (NR > 0) print 100000,sum / 100 }' runtest
awk '{ if (NR>=1901 && NR<=2000) sum += $6; } END { if (NR > 0) print 1000000,sum / 100 }' runtest

awk '{ if (NR <=100) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>100 && NR <=200) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 10000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>200 && NR <=300) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 100000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>300 && NR <=400) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>400 && NR <=500) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>500 && NR <=600) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 10000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>600 && NR <=700) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 100000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>700 && NR <=800) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>800 && NR <=900) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>900 && NR <=1000) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 10000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1000 && NR <=1100) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 100000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1100 && NR <=1200) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1200 && NR <=1300) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1300 && NR <=1400) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 10000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1400 && NR <=1500) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 100000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1500 && NR <=1600) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1600 && NR <=1700) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1700 && NR <=1800) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 10000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1800 && NR <=1900) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 100000,sum2/100 - sum*sum/10000 }' runtest
awk '{ if (NR>1900 && NR <=2000) {sum+=1/$6; sum2+=(1/$6)*(1/$6);} } END { if (NR > 0) print 1000000,sum2/100 - sum*sum/10000 }' runtest
