function z = g(x,y)
    z = -1.2*y+7*exp(-0.3*x);
endfunction

function [x,y] = euler(a,b,h,y0)
    x = a:h:b
    n = length(x);
    y(1)=y0
    for i = 1:n-1
        y(i+1) = y(i) + g(x(i),y(i))*h;
    end
endfunction

[x,ye] = euler(0,2.5,0.5,3)

plot(x',ye,'o')
