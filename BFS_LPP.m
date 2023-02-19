clear all
clc
format short
%MAKE STANDARD EQUATION
%DEFINE PARAMETERS
c=[2 3 4 7]
A=[2 3 -1 4; 1 -2 6 -7]
B=[8; -3]

m=size(A,1)                  %No of constraint
n=size(A,2)                  %No of variable NO OF COLUMNS

if n>=m
   ns=nchoosek(n,m);    % No of basic solutions nCm
   t=nchoosek(1:n,m)    %ALL POSSIBILITIES x1, x2, x3...
else 
    print('Error')
end
sol=[]
for i=1:ns
    %DECLARING X1, X2, X3=0
    y=zeros(n,1)
    %FOR A ROW IN  T, CONSIDERING THE VALUES OF THOSE COLUMN IN A AND
    %FINDING SOLUTION CORRESPONDING TO THOSE VARIABLE
    x=A(:,t(i,:))\B
    %FOR BFS, SOLUTION IS NON NEGATIVE
    if  (x>=0 & x~=inf  & x~=-inf)
        %UPDATING THE VALUE IN BV OF X1, X2, X3
       y(t(i,:))=x
       %1 COL FOR 1 SOLUTION
       sol=[sol y]
    end
end
% A(:,t(i,:))\B
%t(i,:)
% y(t(i,:))
z=c*sol
[zmax, zind]=max(z)
bfs=sol(:,zind)