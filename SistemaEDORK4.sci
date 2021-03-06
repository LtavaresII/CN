function z = gL1(t,L1,L2)
    z = -0.4427*sqrt(L1) + 0.23*(4 + 4*sin(t));
endfunction

function z = gL1(t,L1,L2)
    z = -0.4427*sqrt(L2) + 0.4427*sqrt(L1);
endfunction

function [t,L1,L2] = eulerSistema(a,b,h,L10,L20)
    t = a:h:b
    n = length(t);
    L1(1) = L10
    L2(1) = L20
    for i = 1:n-1
        k1L1 = gL1(t(i),L1(i),L2(i))
        k1L2 = gL2(t(i),L1(i),L2(i))
        
        k2L1 = gL1(t(i)+h/2,L1(i) + k1L1*h/2,L2(i) + k1L2*h/2)
        k2L2 = gL2(t(i)+h/2,L1(i) + k1L1*h/2,L2(i) + k1L2*h/2)
        
        k3L1 = gL1(t(i)+h/2,L1(i) + k2L1*h/2,L2(i) + k2L2*h/2)
        k3L2 = gL2(t(i)+h/2,L1(i) + k2L1*h/2,L2(i) + k2L2*h/2)
        
        k4L1 = gL1(t(i)+h,L1(i) + k3L1*h,L2(i) + k3L2*h)
        k4L2 = gL2(t(i)+h,L1(i) + k3L1*h,L2(i) + k3L2*h)
        
        kL1 = (k1L1 + 2*k2L1 + 2*k3L1 + k4L1)/6
        kL2 = (k1L2 + 2*k2L2 + 2*k3L2 + k4L2)/6
        
        L1(i+1) = L1(i) + kL1*h;
        L2(i+1) = L2(i) + kL2*h;
    end
endfunction

[t,L1,L2] = eulerSistema(0,30,1,0,0);
