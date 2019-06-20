#!/usr/bin/awk
BEGIN{
FS=" "  
arr1[""]=0
arr2[""]=0
arr3[""]=0
arr4[""]=0
arr5[""]=0
arr6[""]=0
arr8[""]=0
lm=0
}
{
lm++
ip1=$3
ip2=substr($5,1,length($5)-1)
time=$1
hour=substr(time,1,2)
min=substr(time,4,2)
sec=substr(time,7,length(time)-6)
total=hour*3600+60*min+sec 
if(!(ip1"'"ip2 in arr4)){
arr4[ip1"'"ip2]=total
arr5[ip1"'"ip2]=total
arr4[ip2"'"ip1]=total
arr5[ip2"'"ip1]=total
}
else{
arr5[ip2"'"ip1]=total
arr5[ip1"'"ip2]=total
}
str1=$8
if( str1 == "ack" ){
ip1=$3
ip2=substr($5,1,length($5)-1)
if(!(ip1"'"ip2 in arr1))
arr1[ip1"'"ip2]=1
else
arr1[ip1"'"ip2]=arr1[ip1"'"ip2]+1
}
else{
ip1=$3
ip2=substr($5,1,length($5)-1)
bits=$9
lk=index(bits,":")
hj=0
	if(!(ip1"'"ip2 in arr6)){
	arr6[ip1"'"ip2]=1
	arr8[ip1"'"ip2]=0
	}
{
	bit1=substr(bits,1,lk-1)
	bit2=substr(bits,lk+1,length(bits)-(lk)-1)
	hj=bit2-bit1
if(lk==0){
bit1=bit2
hj=0}
		if(arr6[ip1"'"ip2]==1){
		arr7[ip1"'"ip2"'"1]=bit1"'"bit2
}
		else{
		flag=0
		for(k=1;k<arr6[ip1"'"ip2];k++){
		l1=index(arr7[ip1"'"ip2"'"k],"'")
		b1=substr(arr7[ip1"'"ip2"'"k],1,l1-1)
		b2=substr(arr7[ip1"'"ip2"'"k],l1+1,length(arr7[ip1"'"ip2"'"k])-(l1))
		if(b1<=bit1&&b2>=bit2){
		arr8[ip1"'"ip2]+=bit2-bit1
if(bit1==bit2)
arr8[ip1"'"ip2]+=1
		flag=1
		break
		}
else if(b1<=bit1 && bit2>=b2 && bit1<=b2){
arr8[ip1"'"ip2]+=b2-bit1
if(b1==b2)
arr8[ip1"'"ip2]+=1
bit1=b2+1
}
else if(b2>=bit2 && b1>=bit1 && bit2>=b1){
arr8[ip1"'"ip2]+=bit2-b1
if(b1==b2)
arr8[ip1"'"ip2]+=1
bit2=b1-1
}
		}
if(flag!=1){
arr7[ip1"'"ip2"'"arr6[ip1"'"ip2]]=bit1"'"bit2
}
else
arr6[ip1"'"ip2]--
	}
arr6[ip1"'"ip2]++
}
if(!(ip1"'"ip2 in arr1)){
arr1[ip1"'"ip2]=1
arr2[ip1"'"ip2]=hj

if(hj==0)
arr3[ip1"'"ip2]=0
else
arr3[ip1"'"ip2]=1
}
else{
arr1[ip1"'"ip2]=arr1[ip1"'"ip2]+1
arr2[ip1"'"ip2]+=hj
arr5[ip1"'"ip2]=total
if(hj!=0)
arr3[ip1"'"ip2]++
}
}
}
END{
for(i in arr1 )
if(i!="" && arr1[i]!=""){
qwe=index(i,"'")
IP1=substr(i,1,qwe-1)
IP2=substr(i,qwe+1,length(i)-qwe)
print "Connection (A="IP1,"B="IP2")"
if(arr8[IP2"'"IP1]<=1)
arr8[IP2"'"IP1]=0
if(arr8[IP1"'"IP2]<=1)
arr8[IP1"'"IP2]=0
print "A-->B","#packets="arr1[IP1"'"IP2]",","#datapackets="arr3[IP1"'"IP2]",","#bytes="arr2[IP1"'"IP2]",","#retrans="arr8[IP1"'"IP2]",","xput="int((arr2[IP1"'"IP2]-arr8[IP1"'"IP2])/(arr5[IP1"'"IP2]-arr4[IP1"'"IP2])),"bytes/sec"
print "B-->A","#packets="arr1[IP2"'"IP1]",","#datapackets="arr3[IP2"'"IP1]",","#bytes="arr2[IP2"'"IP1]",","#retrans="arr8[IP2"'"IP1]",","xput="int((arr2[IP2"'"IP1]-arr8[IP2"'"IP1])/(arr5[IP2"'"IP1]-arr4[IP2"'"IP1])),"bytes/sec"
delete arr1[IP1"'"IP2]
delete arr1[IP2"'"IP1]
}
}
