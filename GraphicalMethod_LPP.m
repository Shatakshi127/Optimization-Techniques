% clear all
% clc
% format short
% %Parameters of objective function
% c=[3 2]
% %Parameters of constraints
% A=[2 4; 3 5]
% B=[8; 15]
% x1=0:1:max(B)
% x21 = (B(1)-A(1,1).*x1)./A(1,2)
% x22 = (B(2)-A(2,1).*x1)./A(2,2)
% x21=max(0,x21);
% x22=max(0,x22);
% plot(x1,x21,'r',x1,x22,'b')
% xlabel('x')
% ylabel('y')
% legend('2x1+4x2=8','3x1+5x2=15')
% cx1=find(x1==0); %point with x1 axis
% c1=find(x21==0); %point with x2 axis
% line1=[x1(:,[c1,cx1]); x21(:,[c1 cx1])]'   %corner points of constraint 1 (transpose  ')
% c2=find(x22==0);
% line2=[x1(:,[c2,cx1]); x22(:,[c2 cx1])]'   %cp of constraint 2
% cornerpoint=unique([line1; line2],'rows')
% %intersection point
% pt=[];    %0,0 means 1st intersection point is 0 but here its not zero. so not necessary to put zero
% for i=1:size(A,1)
%     A1=A(i,:)   %[2 4]
%     B1=B(i,:)   %[8]
%     for j=i+1:size(A,1)
%         A2=A(j,:)      %[3  5]  1st row
%         B2=B(j,:)      %[15]    2nd row
%         A4=[A1;A2]
%         B4=[B1;B2]
%         X4=A4\B4
%         pt=[pt X4]
%     end
% end
% intersection_pt=pt'
% all_pt=[intersection_pt;cornerpoint]
% points=unique(all_pt,'rows')
% %Points in the region for which it satisfies the line
% for i=1:size(points,1)
%     const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
%     const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
% end
%     %removing the values that don't satisfy
%     s1=find(const1>0)
%     s2=find(const2>0)
%     s3=find(points(:,1)<0)    % in 2016 version to avoid -ve
%     s4=find(points(:,2)<0) 
%     s=[s1 s2 s3 s4]
%     %blank point :deletes the points that don't satisfy the equation
%     points(s,:)=[]
%     %till now region is found where point satisfies. now to find the value
%     %satisfying in objective function
%     %value=points*c; not conformable. so take transpose
%     value=points*c';
%     table=[points value]
%     [obj_value, index]=max(value)
%     x1=points(index,1)
%     x2=points(index,2)



% clear all
% clc
% format short
% %Parameters of objective function
% c=[3 2]
% %Parameters of constraints
% A=[2 4; 3 5]
% B=[8; 15]
% x1=0:1:max(B)
% x21 = (B(1)-A(1,1).*x1)./A(1,2)
% x22 = (B(2)-A(2,1).*x1)./A(2,2)
% x21=max(0,x21);
% x22=max(0,x22);
% plot(x1,x21,'r',x1,x22,'b')
% xlabel('x')
% ylabel('y')
% legend('2x1+4x2=8','3x1+5x2=15')
% cx1=find(x1==0); %point with x1 axis
% c1=find(x21==0); %point with x2 axis
% line1=[x1(:,[c1,cx1]); x21(:,[c1 cx1])]'   %corner points of constraint 1 (transpose  ')
% c2=find(x22==0);
% line2=[x1(:,[c2,cx1]); x22(:,[c2 cx1])]'   %cp of constraint 2
% cornerpoint=unique([line1; line2],'rows')
% %intersection point
% pt=[];    %0,0 means 1st intersection point is 0 but here its not zero. so not necessary to put zero
% for i=1:size(A,1)
%     A1=A(i,:)   %[2 4]
%     B1=B(i,:)   %[8]
%     for j=i+1:size(A,1)
%         A2=A(j,:)      %[3  5]  1st row
%         B2=B(j,:)      %[15]    2nd row
%         A4=[A1;A2]
%         B4=[B1;B2]
%         X4=A4\B4
%         pt=[pt X4]
%     end
% end
% intersection_pt=pt'
% all_pt=[intersection_pt;cornerpoint]
% points=unique(all_pt,'rows')
% %Points in the region for which it satisfies the line
% for i=1:size(points,1)
%     const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
%     const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
% end
%     %removing the values that don't satisfy
%     s1=find(const1>0)
%     s2=find(const2<0)
%     s3=find(points(:,1)<0)    % in 2016 version to avoid -ve
%     s4=find(points(:,2)<0) 
%     s=[s1 s2 s3 s4]
%     %blank point :deletes the points that don't satisfy the equation
%     points(s,:)=[]
%     %till now region is found where point satisfies. now to find the value
%     %satisfying in objective function
%     %value=points*c; not conformable. so take transpose
%     value=points*c';
%     table=[points value]
%     [obj_value, index]=max(value)
%     x1=points(index,1)
%     x2=points(index,2)


% clear all
% clc
% format short
% %Parameters of objective function
% c=[3 2]
% %Parameters of constraints
% A=[2 4; 3 5]
% B=[8; 15]
% x1=0:1:max(B)
% x21 = (B(1)-A(1,1).*x1)./A(1,2)
% x22 = (B(2)-A(2,1).*x1)./A(2,2)
% x21=max(0,x21);
% x22=max(0,x22);
% plot(x1,x21,'r',x1,x22,'b')
% xlabel('x')
% ylabel('y')
% legend('2x1+4x2=8','3x1+5x2=15')
% cx1=find(x1==0); %point with x1 axis
% c1=find(x21==0); %point with x2 axis
% line1=[x1(:,[c1,cx1]); x21(:,[c1 cx1])]'   %corner points of constraint 1 (transpose  ')
% c2=find(x22==0);
% line2=[x1(:,[c2,cx1]); x22(:,[c2 cx1])]'   %cp of constraint 2
% cornerpoint=unique([line1; line2],'rows')
% %intersection point
% pt=[];    %0,0 means 1st intersection point is 0 but here its not zero. so not necessary to put zero
% for i=1:size(A,1)
%     A1=A(i,:)   %[2 4]
%     B1=B(i,:)   %[8]
%     for j=i+1:size(A,1)
%         A2=A(j,:)      %[3  5]  1st row
%         B2=B(j,:)      %[15]    2nd row
%         A4=[A1;A2]
%         B4=[B1;B2]
%         X4=A4\B4
%         pt=[pt X4]
%     end
% end
% intersection_pt=pt'
% all_pt=[intersection_pt;cornerpoint]
% points=unique(all_pt,'rows')
% %Points in the region for which it satisfies the line
% for i=1:size(points,1)
%     const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
%     const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
% end
%     %removing the values that don't satisfy
%     s1=find(const1<=0)
%     s2=find(const2<=0)
%     s3=find(points(:,1)<0)    % in 2016 version to avoid -ve
%     s4=find(points(:,2)<0) 
%     s=[s1 s2 s3 s4]
%     %blank point :deletes the points that don't satisfy the equation
%     points(s,:)=[]
%     %till now region is found where point satisfies. now to find the value
%     %satisfying in objective function
%     %value=points*c; not conformable. so take transpose
%     value=points*c';
%     table=[points value]
%     [obj_value, index]=max(value)
%     x1=points(index,1)
%     x2=points(index,2)


clear all
clc
format short
%Parameters of objective function
c=[3 2]
%Parameters of constraints
A=[2 4; 3 5]
B=[8; 15]
x1=0:1:max(B)
x21 = (B(1)-A(1,1).*x1)./A(1,2)
x22 = (B(2)-A(2,1).*x1)./A(2,2)
x21=max(0,x21);
x22=max(0,x22);
plot(x1,x21,'r',x1,x22,'b')
xlabel('x')
ylabel('y')
legend('2x1+4x2=8','3x1+5x2=15')
cx1=find(x1==0); %point with x1 axis
c1=find(x21==0); %point with x2 axis
line1=[x1(:,[c1,cx1]); x21(:,[c1 cx1])]'   %corner points of constraint 1 (transpose  ')
c2=find(x22==0);
line2=[x1(:,[c2,cx1]); x22(:,[c2 cx1])]'   %cp of constraint 2
cornerpoint=unique([line1; line2],'rows')
%intersection point
pt=[];    %0,0 means 1st intersection point is 0 but here its not zero. so not necessary to put zero
for i=1:size(A,1)
    A1=A(i,:)   %[2 4]
    B1=B(i,:)   %[8]
    for j=i+1:size(A,1)
        A2=A(j,:)      %[3  5]  1st row
        B2=B(j,:)      %[15]    2nd row
        A4=[A1;A2]
        B4=[B1;B2]
        X4=A4\B4
        pt=[pt X4]
    end
end
intersection_pt=pt'
all_pt=[intersection_pt;cornerpoint]
points=unique(all_pt,'rows')
%Points in the region for which it satisfies the line
for i=1:size(points,1)
    const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-B(1);
    const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-B(2);
end
    %removing the values that don't satisfy
    s1=find(const1> ...
        0)
    s2=find(const2<=0)
    s3=find(points(:,1)<0)    % in 2016 version to avoid -ve
    s4=find(points(:,2)<0) 
    s=[s1 s2 s3 s4]
    %blank point :deletes the points that don't satisfy the equation
    points(s,:)=[]
    %till now region is found where point satisfies. now to find the value
    %satisfying in objective function
    %value=points*c; not conformable. so take transpose
    value=points*c';
    table=[points value]
    [obj_value, index]=min(value)
    x1=points(index,1)
    x2=points(index,2)


    %deleting the value that don't satisfy. So the signs in const are of
    %opposite.
    