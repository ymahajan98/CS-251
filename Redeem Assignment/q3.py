#!/usr/bin/python
s=raw_input()
q=len(s)
s=s[1:q-1]
s=s.split(',')
s=[int(i) for i in s]
s.sort()
count=0
mul=2
j=1
while (count<len(s) and j<10):
    j=j+1
    k=int(len(s)/mul)
    counter=1
    for i in range(len(s)):
        if(s[i]!='a' and i==k):
            print s[i],
            s[i]='a'
            count=count+1
            counter=counter+1
            if(k==0):
                counter=1
                mul=len(s)
            k=counter*len(s)/mul
        elif(s[i]=='a' and i==k):
            counter=counter+1
            if(k==0):
                counter=1
                mul=len(s)
            k=counter*len(s)/mul
	    print " ",
        else:
		print " ",
    mul=mul*2
    print "\n",
