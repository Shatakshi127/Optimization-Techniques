% TWO PHASE METHOD
%Can be any be it slack or surplus

clc
clear all
%-----Problem 1----
Variables={'x1','x2','s1','s2','A1','A2','sol'};
OVariables={'x_ 1','x_ 2','s_ 1','s_ 2','sol'}; % original variables
OrigC=[-3 -5 0 0 -1 -1 0];
a=[1 3 -1 0 1 0; 1 1 0 -1 0 1];
b=[3;2];
A=[a b];

%-----Problem 2----
% Variables={'x1','x2','s1','s2','A1','A2','sol'};
% OVariables={'x_ 1','x_ 2','s_ 1','s_ 2','sol'}; 
% OrigC=[-3 4 0 0 -1 -1 0];
% a=[1 -1 -1 0 1 0; 2 -1 0 -1 0 1];
% b=[0;2];
% A=[a b];
% PHASE-1
fprintf('********** PHASE-1 ********** \n')
%----Problem 1-----
cost=[0 0 0 0 -1 -1 0]
Artifical_var=[5 6]             
bv=[5 6];
 
 %----Problem 2----
%  cost=[ 0 0 0 0 -1 -1 0];
%  Artifical_var=[5 6];  Here R1 R2. 
%  bv=[5 6];             Here by chance R1 R2 but can be s1 R1 R2.Identity.

 
zjcj=cost(bv)*A-cost;
simplex_table=[zjcj;A];
array2table(simplex_table,'VariableNames',Variables)
RUN=true;
while RUN
if any(zjcj(1:end-1)<0) % check for negative value
 fprintf(' the current BFS is not optimal \n')
 zc=zjcj(1:end-1);
 [Enter_val, pvt_col]= min(zc);
 if all(A(:,pvt_col)<=0)
 error('LPP is Unbounded all enteries are <=0 in column % d',pvt_col);
 else
 sol=A(:,end);
 column=A(:,pvt_col);
 for i=1:size(A,1)
 if column(i)>0
 ratio(i)= sol (i)./column(i);
 else
 ratio(i)=Inf;
 end
 end
 [leaving_val, pvt_row]=min(ratio);
 end
bv(pvt_row)=pvt_col;
pvt_key=A(pvt_row, pvt_col);
A(pvt_row,:)=A (pvt_row,:)./pvt_key;
for i=1:size(A,1)
 if i~=pvt_row
 A(i,:)=A(i,:)-A (i, pvt_col).*A(pvt_row,:);
 end
end
%  zjcj=zjcj-zjcj (pvt_col).*A(pvt_row,:);
zjcj=cost(bv)*A-cost;
 next_table=[zjcj;A];
 table=array2table(next_table,'VariableNames',Variables)
else
 RUN=false;
 if any(bv==Artifical_var(1)) || any(bv==Artifical_var(2))
     error('Infeasible solution');
 else
  fprintf('optimal table of phase-1 is achieved \n');
 end
end
end

% PHASE-2
fprintf('********** PHASE-2 ********** \n')
A(:,Artifical_var)=[]; % Removing Artificial var by giving them empty value
OrigC(:,Artifical_var)=[]; % Removing Artificial var cost by giving them empty value
cost=OrigC;
zjcj=cost(bv)*A-cost;
simplex_table=[zjcj;A];
array2table(simplex_table,'VariableNames',OVariables)

RUN=true;
while RUN
if any(zjcj(1:end-1)<0) % check for negative value
 fprintf('The current BFS is not optimal \n')
 zc=zjcj(1:end-1);
 [Enter_val, pvt_col]= min(zc);
 if all(A(:,pvt_col)<=0)
 error('LPP is Unbounded, all entries are <=0 in column %d',pvt_col);
 else
 sol=A(:,end);
 column=A(:,pvt_col);
 for i=1:size(A,1)
 if column(i)>0
 ratio(i)= sol (i)./column(i);
 else
 ratio(i)=inf;
 end
 end
 [leaving_val, pvt_row]=min(ratio);
 end
bv(pvt_row)=pvt_col;
pvt_key=A(pvt_row, pvt_col);
A(pvt_row,:)=A (pvt_row,:)./pvt_key;
for i=1:size(A,1)
 if i~=pvt_row
 A(i,:)=A(i,:)-A (i, pvt_col).*A(pvt_row,:);
 end
end
%  zjcj=zjcj-zjcj (pvt_col).*A(pvt_row,:);
zjcj=cost(bv)*A-cost;
next_table=[zjcj;A];
 table=array2table(next_table,'VariableNames',OVariables)
else
 RUN=false;
  fprintf('The current BFS is optimal \n');
  z=input(' Enter 0 for minimization and 1 for max \n');
    if z==0
        Obj_value=-zjcj(end);
    else
        Obj_value=zjcj(end);
    end
    fprintf('The final optimal value is %f \n',Obj_value);
 end
end




clc
clear all
cost=[0 0 0 0 0 -1 -1 -1 0]
A1=[5 1 -1 0 0 1 0 0; 6 5 0 -1 0 0 1 0;1 4 0 0 -1 0 0 1]
B=[10;30;8]
A=[A1 B]
Artificial_var=[6 7 8]
BV=[6 7 8]
zjcj=cost(BV)*A-cost
zcj=[zjcj;A]
SimplexT=array2table(zcj,'VariableNames',{'x1','x2','s1','s2','s3','R1','R2','R3','sol'})
Run=true;
while Run
    if any (zjcj(1:end-1)<0)
        fprintf('not optimal')
        disp(BV)
        zc=zjcj(1:end-1)
        [entering_val pvt_col]=min(zc)
        fprintf('%d',pvt_col)
        sol=A(:,end)
        column=A(:,pvt_col)
        if column<=0
            fprintf('unbounded')
        else
            for i=1:size(A,1)
                if column(i)>=0
                    ratio(i)=sol(i)/column(i)
                else
                    ratio(i)=inf
                end
            end
        end
                    [leaving_val pvt_row]=min(ratio)
            BV(pvt_row)=pvt_col
            pvt_key=A(pvt_row,pvt_col)
            A(pvt_row,:)=A(pvt_row,:)/pvt_key
            for i=1:size(A,1)
                if i~=pvt_row
                    A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:)
                end
            end
            zjcj=cost(BV)*A-cost
            new_table=[zjcj;A]
            SimplexT=array2table(new_table,'VariableNames',{'x1','x2','s1','s2','s3','R1','R2','R3','sol'})
        else
            Run=false;
            if (any(BV==Artificial_var(1)) || any(BV==Artificial_var(2)) || any(BV==Artificial_var(3)))
                fprintf('infeasible')
        else
            fprintf('optimal')
        end
    end
end
