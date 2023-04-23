%SIMPLEX METHOD
%Always slack


clc
clear all
format short
c=[-1 3 -2]
a1=[3 -1 2; -2 4 0; -4 3 8]
b=[7; 12 ;10]
s=eye(size(a1,1))
a=[a1 s b]
cost=zeros(1,size(a,2))
variables=size(a1,2)
cost(1:variables)=c
bv=variables+1:size(a,2)-1
zjcj=cost(bv)*a-cost
zcj=[zjcj;a]
simplexT=array2table(zcj,'VariableNames',{'x1','x2','x3','s1','s2','s3','soln'})
Run=true;
while Run
if any(zjcj(1:end-1)<0)
fprintf('table not optimal');
disp('old basic variables are=')
disp(bv)
zc=zjcj(1:end-1)
[minval pvt_col]=min(zc)
fprintf('entering variable is %d',pvt_col)
sol=a(:,end)
column=a(:,pvt_col)
if all(column<=0)
fprintf('lpp is unbounded')
else
for(i=1:size(column,1))
if(column(i)>0)
ratio(i)=sol(i)/column(i);
else
ratio(i)=inf;
end
end
end
[minval pvt_row]=min(ratio)
fprintf('leaving variable is',pvt_row)
bv(pvt_row)=pvt_col
disp('new basic variable=')
disp(bv)
pvt_key=a(pvt_row,pvt_col)
a(pvt_row,:)=a(pvt_row,:)/pvt_key
for i=1:size(a,1)
if i~=pvt_row
a(i,:)=a(i,:)-a(i,pvt_col).*a(pvt_row,:)
end
end
zjcj=zjcj-zjcj(pvt_col).*a(pvt_row,:)
zcj=[zjcj;a]
simplexT=array2table(zcj,'VariableNames',{'x1','x2','x3','s1','s2','s3','soln'})
bfs=zeros(1,size(a,2))
bfs(bv)=a(:,end);
bfs(end)=sum(bfs.*cost);
currentbfs=array2table(bfs,'VariableNames',{'x1','x2','x3','s1','s2','s3','soln'})
else
Run=false;
fprintf('table is optimal')
end
end
