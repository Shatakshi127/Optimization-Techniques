% BIG M
%Can be any be it slack or surplus

%M1::::::::
clc
clear all
%convert min problem into max problem

M=1000;  %Assign large value to M
cost=[-2 -1 0 0 -M -M 0];  %Additional zero at last for sol column
A=[3 1 0 0 1 0 3;4 3 -1 0 0 1 6;1 2 0 1 0 0 3];

%cost=zeros(1,size(A,2))
nv=size(A,2)
%cost(1:nv)=C
[cost;A]
bv=[5 6 4];
%bv=nv+1:size(A,2)-1
zjcj=cost(bv)*A-cost
zcj=[zjcj;A]
%simplex=array2table(zc)
optimal_table=array2table(zcj,'VariableNames',{'x1','x2','x3','A1','A2','A3','soln'})

Run=true;
while Run
if any(zjcj(1:end-1)<0)
    fprintf("Optimality Not Reached")
    disp("Old Basic Variable: ")
    disp(bv)
    zc=zjcj(1:end-1)
    %Entering Variable
    [min_val pvt_col]=min(zc)
    fprintf("Entering Variable: %f",pvt_col)

    %leaving variable
    sol=A(:,end)
    column=A(:,pvt_col)

    if all(column<0)
        fprintf("LPP is Unbounded")
    else
        for i=1:size(column,1)
            if (column(i)>0)
                ratio(i)=sol(i)/column(i);
            else
                ratio(i)=inf;
            end
        end
    end
    ratio
    [min_val pvt_row]=min(ratio)
    fprintf("Leaving Variable is: %f",pvt_row)

    bv(pvt_row)=pvt_col
    disp("New Basic Variables:%f")
    disp(bv)
    pvt_key=A(pvt_row,pvt_col)
    A(pvt_row,:)=A(pvt_row,:)/pvt_key;
    for i=1:size(A,1)
        if(i~=pvt_row)
            A(i,:)=A(i,:)-A(pvt_row,:)*A(i,pvt_col);
        end
    end
    zjcj=zjcj-zjcj(pvt_col)*A(pvt_row,:)

    %To print updated table
    zcj=[zjcj;A]
    optimal_table=array2table(zcj,'VariableNames',{'x1','x2','x3','A1','A2','A3','soln'})
    bfs=zeros(1,size(A,2))
    bfs(bv)=A(:,end);
    bfs(end)=sum(bfs.*cost);
    current_bfs=array2table(bfs,'VariableNames',{'x1','x2','x3','A1','A2','A3','soln'})

else
    Run=false;
    fprintf("Optimal solution reached")
end
end % end for while


%M2::::::::
clc
clear all
format short
M=1000
cost=[3 2 0 0 -M 0]
a=[1 1 1 0 0 2;1 3 0 1 0 3;1 -1 0 0 1 1]

% bv=[3 4 5]
s=eye(size(a,1));
bv=[]
for j=1:size(s,2)
    for i=1:size(a,2)
        if a(:,i)==s(:,j)
            bv=[bv i];
        end
    end
end


zjcj=cost(bv)*a-cost
zcj=[zjcj;a]
simplexT=array2table(zcj,'VariableNames',{'x1','x2','s1','s2','A1','soln'})
Run=true;
while Run
    zc=zjcj(:,1:end-1)
if any(zc<0)
 fprintf('table not optimal');
 disp('old basic variables are=')
 disp(bv)
 
[minval pvt_col]=min(zc)
fprintf('entering variable is %d',pvt_col)

sol=a(:,end)
column=a(:,pvt_col)
if all(column<=0)
fprintf('lpp is unbounded')
else
for i=1:size(column,1)
if column(i)>0
 ratio(i)=sol(i)./column(i);
else
ratio(i)=inf;
end
end
end

[minr pvt_row]=min(ratio)
fprintf('leaving variable is',pvt_row)
bv(pvt_row)=pvt_col
disp('new basic variable=')
disp(bv)
pvt_key=a(pvt_row,pvt_col)
a(pvt_row,:)=a(pvt_row,:)./pvt_key
 for i=1:size(a,1)
 if i~=pvt_row
a(i,:)=a(i,:)-a(i,pvt_col).*a(pvt_row,:)
 end
 end
 zjcj=cost(bv)*a-cost

zcj=[zjcj;a]
simplexT=array2table(zcj,'VariableNames',{'x1','x2','s1','s2','A1','soln'})
bfs=zeros(1,size(a,2))
bfs(bv)=a(:,end);
 bfs(end)=sum(bfs.*cost);
currentbfs=array2table(bfs,'VariableNames',{'x1','x2','s1','s2','A1','soln'})

else
Run=false;
fprintf('table is optimal')
end
end
