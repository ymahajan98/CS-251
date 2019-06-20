#!/usr/bin/awk
BEGIN{
f1=0
f2=0
str=0
com=0      
}
{ 
pos1=index($0,"//");
pos2=index($0,"/*");
pos3=index($0,"*/");
pos4=index($0,"\"");
if(pos2>0 && f1==0 && (pos4==0||(pos4>0 && pos2<pos4)) && (pos1==0||(pos1>0 && pos2<pos1)) && pos3==0){
	f1=1;
	com++;}
else if(pos2>0 && f1==0 && (pos4==0||(pos4>0 && pos2<pos4)) && (pos1==0||(pos1>0 && pos2<pos1)) && pos3>pos2){
com++;
}
else if(f1==1 && pos3==0){
	com++;
}
else if(f1==1){
	com++;
	f1=0;
}
else if(pos1>0 && (pos4==0||(pos4>0 && pos1<pos4))){
	com++;
}
else if(pos4>0){
	str++;
	subs = substr($0, pos4+1,length($0)-pos4);
	pos4=index(subs,"\"");
	subs = substr(subs, pos4+1,length(subs)-pos4);
	pos4=index(subs,"\"");	
        pos1=index(subs,"//");
	pos2=index(subs,"/*");
	pos3=index(subs,"*/");
	if(pos2>0 && (pos1==0||(pos1>0 && pos2<pos1)) && pos3<=pos2 ){
	f1=1;
	com++;}
	else if(pos2>0 && (pos1==0||(pos1>0 && pos2<pos1)) && pos3>pos2){
	com++;
	}
	else if(pos1>0){
	com++;
}
}
}
END{
print str,com;
}
