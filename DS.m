%DUAL SIMPLEX_DS
%Always slack



%M111111111111111::::::::::::::;;
%DUAL SIMPLEX

clc
clear all
cost=[-2 0 -1 0 0 0]
A=[-1 -1 1 1 0 -5; -1 2 -4 0 1 -8]
BV=[4 5]
zjcj=cost(BV)*A-cost
%print table 
SimpTable=[zjcj;A];
array2table(SimpTable,'VariableName',{'x1','x2','x3','s1','s2','sol'})
Run=true;
while Run
        %feasibility condition
        sol=A(:,end)
if any(sol<0)
        fprintf('current bfs is not feasible')
        %leaving variable
        [leaving_val,pvt_row]=min(sol)
        fprintf('leaving variable is %d',pvt_row)
        %entering variable
        for i=1:size(A,2)-1
                if A(pvt_row,i)<0
                        ratio(i)=abs(zjcj(i)/A(pvt_row,i));
                else
                        ratio(i)=inf;
                end
        end
        [entering_val, pvt_col]=min(ratio)
        fprintf('entering variable is %d', pvt_col)
        BV(pvt_row)=pvt_col
         pvt_key=A(pvt_row,pvt_col)
                A(pvt_row,:)=A(pvt_row,:)./pvt_key
                for i=1:size(A,1)
               if i~=pvt_row
                    A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:);
                end
                end
                BV(pvt_row)=pvt_col
                zjcj=cost(BV)*A-cost
                new_table=[A;zjcj]
                array2table(new_table,'VariableNames',{'x1','x2','x3','s1','s2','sol'})
else
                Run=false
                fprintf('optimal sol is %f',zjcj(end))
end

end



%M222222222222::::::::::::::::::::
clc
clear all
%prerequisite: convert min to max problem & convert >= to <=
%parameter input
cost=[-3 -5 0 0 0] %last 0 for soln
a=[-1 -3 1 0 -3;-1 -1 0 1 -2]
bv=[3 4] %position of basic variables
nv=size(a,2) %no of variables in original matrix

zjcj=cost(bv)*a-cost


zcj=[zjcj;a]
% simplex=array2table(zc)
optimal_table=array2table(zcj,'VariableNames',{'x1','x2','s1','s2','soln'})

Run=true;
while Run 

%feasibility condition
sol=a(:,end)
if any(sol<0)
    fprintf('Current BFS is not feasible')
%leaving variable
[leaving_value pvt_row]=min(sol)
fprintf('Leaving variable: %d',pvt_row)


%entering variable
for i=1:size(a,2)-1
    if a(pvt_row,i)<0
        ratio(i)=abs(zjcj(i)/a(pvt_row,i));
    else
        ratio(i)=inf;
    end
end
[entering_value pvt_col]=min(ratio)
fprintf('Entering variable: %d',pvt_col)
bv(pvt_row)=pvt_col;
pvt_key=a(pvt_row ,pvt_col)
%update table for new iteration
a(pvt_row,:)=a(pvt_row,:)/pvt_key
for i=1:size(a,1)
    if i~=pvt_row
        a(i,:)=a(i,:)-a(pvt_row,:)*a(i,pvt_col)
    end
end
zjcj=zjcj-zjcj(pvt_col)*a(pvt_row,:)
%to print updated table
zcj=[zjcj;a]
optimal_table=array2table(zcj,'VariableNames',{'x1','x2','s1','s2','soln'})
bfs=zeros(1,size(a,2))
bfs(bv)=a(:,end);
bfs(end)=sum(bfs.*cost); %update soln %element wise multiplication
current_bfs=array2table(bfs,'VariableNames',{'x1','x2','s1','s2','soln'})   %ans

else
    Run=false;
    fprintf('Optimal soln reached')
end
end
