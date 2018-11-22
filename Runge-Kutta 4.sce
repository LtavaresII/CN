function z = g(x,y)
    z = -1.2*y+7*exp(-0.3*x);
endfunction

function [x,y] = rk4(a,b,h,y0)
    x = a:h:b
    n = length(x);
    y(1)=y0
    for i = 1:n-1
        k1 = g(x(i),y(i))
        k2 = g(x(i)+h/2,y(i) + k1*h/2)
        k3 = g(x(i)+h/2,y(i) + k2*h/2)
        k4 = g(x(i)+h,y(i) + k3*h)
        k = (k1 + 2*k2 + 2*k3 + k4)/6
        y(i+1) = y(i) + k*h;
    end
endfunction

[x,ykr4] = kr4(0,2.5,0.5,3)

plot(x',ykr4,'-')
