function z = gx(t,x,y)
    z = x*t - y
endfunction

function w = gy(t,x,y)
    w = y*t + x
endfunction

function [t,x,y] = heun(a,b,h,x0,y0)
    t = a:h:b
    n = length(t);
    x(1) = x0
    y(1) = y0
    for i = 1:n-1
        k1x = gx(t(i),x(i),y(i))
        k1y = gy(t(i),x(i),y(i))
        
        k2x = gx(t(i) + h,x(i) + k1x*h,y(i) + k1y*h)
        k2y = gy(t(i) + h,x(i) + k1x*h,y(i) + k1y*h)
        
        kx = (k1x + k2x)/2
        ky = (k1y + k2y)/2
        
        y(i+1) = y(i) + ky*h
        x(i+1) = x(i) + kx*h
        t(i+1) = t(i) + h
    end
endfunction

[t,x,y] = heun(0,1.2,0.3,1,0.5)
