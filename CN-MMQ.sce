x=[0 1 1.5 2 2.5]
y=[5.02 5.21 6.49 9.54 16.02]
A=[exp(0) exp(1) exp(1.5) exp(2) exp(2.5);exp(0) exp(-1) exp(-1.5) exp(-2) exp(-2.5)]
c=[5.02 5.21 6.49 9.54 16.02]
ATA=A'*A
ATc=A'*c
Xc=inv(ATA)*ATc
Ve=A*Xc-c
Eq=sum(Ve.^2)
function y=f(x)
    y=A.*exp(x)+B.*exp(-x)
endfunction
x=0:0.1:2.5
y=f(x)
plot(x,y)
plot(x,y,'.')
