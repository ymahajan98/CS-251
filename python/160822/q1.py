#!/usr/bin/python
import sys
N=sys.argv[1]
b=sys.argv[2]
map1 = {'1': 1, '2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'0':0,'A':10,'B':11,'C':12,'D':13,'E':14,'F':15,'G':16,'H':17,'I':18,'J':19,'K':20,'L':21,'M':22,'N':23,'O':24,'P':25,'Q':26,'R':27,'S':28,'T':29,'U':30,'V':31,'W':32,'X':33,'Y':34,'Z':35}
b1=0
j=0
while j<len(b):
    if not (b[j]>='0' and b[j]<='9'):
        print "Invalid Input"
        quit()
    b1=b1*10+map1[b[j]]
    j=j+1
fneg=0
frac=0
invalid=0
leng=len(N)
if( N[0]=='-'):
    fneg=1
    leng=leng-1
sum=0
for i in N:
    if(i=="."):
        frac=frac+1
if(frac>1):
    print "Invalid Input"
    quit()
if not (frac):
    i=0
    j=len(N)-1
    l=0
    while i<leng:
        if(N[j]>='0' and N[j]<='9'):
            l=map1[N[j]]
            if(map1[N[j]]+1>b1):
                invalid=1
        elif(N[j]>='A' and N[j]<='Z'):
            l=map1[N[j]]
            if(map1[N[j]]>b1):
                 invalid=1
        else:
            invalid=1
        sum=sum+l*(b1**i)
        i=i+1
        j=j-1
else:
     a1,a2=N.split(".")
     i=0
     j=len(a1)-1
     l=0
     leng=len(a1)
     if(fneg==1):
         leng=leng-1
     while i<leng:
         if(a1[j]>='0' and a1[j]<='9'):
             l=map1[a1[j]]
             if(map1[a1[j]]+1>b1):
                invalid=1
         elif(a1[j]>='A' and a1[j]<='Z'):
             l=map1[a1[j]]
             if(map1[a1[j]]>b1):
                  invalid=1
         else:
             invalid=1
         sum=sum+l*(b1**i)
         i=i+1
         j=j-1
     i=1
     j=i-1
     l=0
     leng=len(a2)
     while i<=leng:
         if(a2[j]>='0' and a2[j]<='9'):
             l=map1[a2[j]]
             if(map1[a2[j]]+1>b1):
                 invalid=1
         elif(a2[j]>='A' and a2[j]<='Z'):
             l=map1[a2[j]]
             if(map1[a2[j]]>b1):
                  invalid=1
         else:
             invalid=1
         sum=sum+l*(b1**(-i))
         i=i+1
         j=j+1
if(fneg==1):
    sum=sum*(-1)
if(invalid==1):
    print "Invalid Input"
else:
    print sum
