A=[8 -4 2;5 10 2;3 -1 7]
b=[-22;-44;-53]
D=A.*eye(A)
InvD=inv(D)
B=eye(A)-InvD*A
g=InvD*b
x=zeros(b)
xOld=x
x=B*x + g
Er=max(abs(x-xOld))/max(abs(x))
Betas=ones(b)
Bt=abs(B)
Betas(1)=Bt(1,:)*Betas
Betas(2)=Bt(2,:)*Betas
Betas(3)=Bt(3,:)*Betas
Bi=abs(sepc(B))//Autovalores de B
