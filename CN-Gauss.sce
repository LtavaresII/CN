A=[2 -1 3;-2 -2 -3;-2 7 1]
b=[1;-4;5]
F1=A(2)/A(1)
F2=A(3)/A(1)
A(2,:)=A(2,:)-F1*A(1,:)
A(3,:)=A(3,:)-F2*A(1,:)
F3=A(3,2)/A(2,2)
A(3,:)=A(3,:)-F3*A(2,:)
U=A
L=[1 F1 F2;0 1 F3;0 0 1]
L=L'
y=inv(L)*b
x=inv(U)*y
