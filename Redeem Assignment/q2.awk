#!/usr/bin/awk
BEGIN{
FS=" "  
map[""]=0
process[""]=0
t1[""]=0
si[""]=0
thread[""]=0
promon[""]=0
lm=0
}
{
if(lm==0){
map[$1]=1
map[$2]=2
map[$3]=3
map[$4]=4
map[$5]=5
map[$6]=6
map[$7]=7
map[$8]=8
}
else{
user=$(map["USER"])
id1=$(map["PID"])
size=$(map["SZ"])
lw1=$(map["LWP"])
time=$(map["TIME"])
hour=substr(time,1,2)
min=substr(time,4,2)
sec=substr(time,7,2)
total=hour*3600+60*min+sec 
if(!(user in process)){
process[user]=0
si[user]=0
t1[user]=0
thread[user]=0
}
t1[user]=total+t1[user]
if(!(user"'"id1 in promon)){
promon[user"'"id1]=1
si[user]=si[user]+size
process[user]++
}
thread[user]++


}
lm++
}
END{
counter=0
for(i in process)
if(i!="")
counter++
print "No. of users",counter
counter=0
for(i in process){
if(i!=""){
counter++
print "User",counter,":",i
print "	Total Processes:",process[i]
print "	Total Threads:",thread[i]
print "	Total Time:",t1[i],"seconds"
print "	Total Memory:",si[i]}
}
}
