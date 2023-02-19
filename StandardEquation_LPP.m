clc
clear all
c=[2 -3 6];
A=[1 0 -3; 2 -8 3;-1 -1 0]
B= [4;4;7]
s= eye(size(A,1))
inequality=[1 0 0]
index=find(inequality>0)
s(index,:)=-s(index,:)
[A s B]