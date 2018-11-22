function z = g(x,y)
    z = -1.2*y+7*exp(-0.3*x);
endfunction

function [x,y] = heun(a,b,h,y0)
    x = a:h:b
    n = length(x);
    y(1)=y0
    for i = 1:n-1
        k1 = g(x(i),y(i))
        k2 = g(x(i)+h,y(i) + k1*h)
        k = 0.5*(k1+k2)
        y(i+1) = y(i) + k*h;
    end
endfunction

[x,yh] = heun(0,2.5,0.5,3)

plot(x',yh,'x')
