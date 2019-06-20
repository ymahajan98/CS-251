#!/usr/bin/python
import os
import sys
import math
import numpy as np
import matplotlib.pyplot as plt
from numpy.linalg import inv
tarin=np.genfromtxt('train.csv',delimiter=',')
tarin=np.delete(tarin, (0), axis=0)
x_train=tarin[:,0]
y_train=tarin[:,1]
x2=np.column_stack((np.ones((x_train.shape[0])),x_train))
w=np.random.rand(2,1)
plt.plot(x_train,y_train,'b',linestyle='None',marker='o')
x3=np.dot((w.T),(x2.T))
x3=np.reshape(x3,x_train.shape)
plt.plot(x_train,x3,'r')
plt.show()
w_d=np.dot(inv(np.dot(x2.T,x2)),np.dot(x2.T,y_train))
plt.plot(x_train,y_train,'b',linestyle='None',marker='o')
x4=np.dot((w_d.T),(x2.T))
x4=np.reshape(x4,x_train.shape)
plt.plot(x_train,x4,'r')
plt.show()
for i in range(0,10):
	for j in range (0,x_train.shape[0]):
		xq=x_train[j]
		yq=y_train[j]
		xfor= np.array([[1,xq]])
		xfor=xfor.T
		eta=(0.00000001*(np.dot(w.T,xfor)-yq))*xfor
		w=w-eta
		if(j%100==0):
                        plt.plot(x_train,y_train,'b',linestyle='None',marker='o')
			x5=np.dot((w.T),(x2.T))
			x5=np.reshape(x5,x_train.shape)
			plt.plot(x_train,x5,'r')
plt.show()
plt.plot(x_train,y_train,'b',linestyle='None',marker='o')
x5=np.dot((w.T),(x2.T))
x5=np.reshape(x5,x_train.shape)
plt.plot(x_train,x5,'r')
plt.show()
tes=np.genfromtxt('test.csv',delimiter=',')
tes=np.delete(tes, (0), axis=0)
x_test=tes[:,0]
y_test=tes[:,1]
xtes=np.column_stack((np.ones((x_test.shape[0])),x_test))
ypred1=np.dot(xtes,w)
ypred2=np.dot(xtes,w_d)
e1=0
e2=0
for i in range(0,y_test.shape[0]):
	e1=e1+(ypred1[i]-y_test[i])*(ypred1[i]-y_test[i])
	e2=e2+(ypred2[i]-y_test[i])*(ypred2[i]-y_test[i])
e1=e1/y_test.shape[0]
e2=e2/y_test.shape[0]
e1=math.sqrt(e1)
e2=math.sqrt(e2)
print "Error y_pred1 is",e1
print "Error y_pred2 is",e2
