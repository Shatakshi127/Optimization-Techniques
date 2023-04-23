%LEAST COST TRANSPORTATION

clc
clear all
format short

%% question parameters
cost=[11 20 7 8;21 16 10 12;8 12 18 9]
a=[50 40 70]
b=[30 25 35 40]

%% balancing
if sum(a)==sum(b)
    fprintf('balanced transportation problem')
else 
    fprintf('unbalanced transportation problem')
    if sum(a)<sum(b)
        cost(end+1,:)=zeros(1,length(b))
        a(end+1)=sum(b)-sum(a)
    else
        cost(:,end+1)=zeros(length(a),1)
        b(end+1)=sum(a)-sum(b)
    end
end

%% storing initial parameters
initcost=cost
x=zeros(size(cost))
[m n]=size(cost)
bfs=m+n-1

%% lcm operations
for i=1:size(cost,1)
    for j=1:size(cost,2)
        mincost=min(cost(:))
        [rowind colind]=find(mincost==cost)
        x1=min(a(rowind),b(colind))
        [val ind]=max(x1)
        ii=rowind(ind)
        jj=colind(ind)
        y1=min(a(ii),b(jj))
        x(ii,jj)=y1
        a(ii)=a(ii)-y1
        b(jj)=b(jj)-y1
        cost(ii,jj)=inf
    end
end

%% print bfs
fprintf('initial bfs\n')
ibfs=array2table(x)

%% check degeneracy
totalbfs=length(nonzeros(x))
if totalbfs==bfs
    fprintf('non degenerate solution')
else
    fprintf('degenerate solution')
end

%% compute initial transportation cost
itc=sum(sum(initcost.*x))
fprintf('initial bfs cost is\n')
itc