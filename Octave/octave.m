data=csvread("train.csv",1,0);
x_d=data(:,1);
y_train=data(:,2);
x_train=[ones(rows(x_d),1) x_d];
w=rand(2,1);
hold("on");
xlabel("x");
ylabel("y");
scatter(x_d,y_train);
plot(x_d,x_train*w);
print -dpdf "Step3.pdf";
close;
w_direct=inv((x_train')*x_train)*(x_train')*y_train;
hold("on");
xlabel("x");
ylabel("y");
scatter(x_d,y_train);
plot(x_d,x_train*w_direct);
print -dpdf "Step4.pdf";
close;
hold("on");
xlabel("x");
ylabel("y");
scatter(x_d,y_train);
for i=1:5,
	for k=1:length(x_d),
		w=w-0.00000001*((x_train(k,:)*w)-y_train(k,:))*(x_train(k,:)');
		if mod(k,100)==0,
			plot(x_d,x_train*w);
		end;
	end;
end;
print -dpdf "Step5.pdf";
close;
hold("on");
xlabel("x");
ylabel("y");
scatter(x_d,y_train);
plot(x_d,x_train*w);
print -dpdf "Step6.pdf";
close;
data1=csvread("test.csv",1,0);
x_d1=data1(:,1);
y_test=data1(:,2);
x_test=[ones(rows(x_d1),1) x_d1];
y_pred1=x_test*w;
y_pred2=x_test*w_direct;
rms_ypred1_ytest=sqrt(mean((y_pred1-y_test).^2))
rms_ypred2_ytest=sqrt(mean((y_pred2-y_test).^2))
