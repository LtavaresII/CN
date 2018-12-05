
function w = gx(t,x,z)
    w = z
endfunction

function w = gz(t,x,z)
    w = (-8/2)*x + (5/2)*cos(3*t)
endfunction

function [t,x,z] = RK4(a,b,h,x0,z0)
    t = a:h:b
    n = length(t);
    x(1) = x0
    z(1) = z0
    for i = 1:n-1
        k1x = gx(t(i),x(i),z(i))
        k1z = gz(t(i),x(i),z(i))
        
        k2x = gx(t(i) + h/2,x(i) + k1x*h/2,z(i) + k1z*h/2)
        k2z = gz(t(i) + h/2,x(i) + k1x*h/2,z(i) + k1z*h/2)
        
        k3x = gx(t(i) + h/2,x(i) + k2x*h/2,z(i) + k2z*h/2)
        k3z = gz(t(i) + h/2,x(i) + k2x*h/2,z(i) + k2z*h/2)
        
        k4x = gx(t(i) + h,x(i) + k3x*h,z(i) + k3z*h)
        k4z = gz(t(i) + h,x(i) + k3x*h,z(i) + k3z*h)
        
        kx = (k1x + 2*k2x + 2*k3x + k4x)/6
        kz = (k1z + 2*k2z + 2*k3z + k4z)/6
        
        x(i+1) = x(i) + kx*h
        z(i+1) = z(i) + kz*h
        t(i+1) = t(i) + h
    end
endfunction

[t,x,z] = RK4(0,10,1,0.1,0.1)
plot(t,[x,z],'b')

