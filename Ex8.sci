function y = gL1(t,L1,L2)
    y = (-0.178139/15.5179)*sqrt(2*980*L1) + (4.6/15.5179)*(6 + 5*sen(t))
endfunction

function w = gL2(t,L1,L2)
    w = (-0.178139/15.5179)*sqrt(2*980*L2) + (0.178139/15.5179)*sqrt(2*980*L1)
endfunction

function [t,L1,L2] = RK4(a,b,h,L10,L20)
    t = a:h:b
    n = length(t)
    L1(1) = L10
    L2(1) = L20
    for i = 1:n-1
        k1L1 = gx(t(i),L1(i),L2(i))
        k1L2 = gz(t(i),L1(i),L2(i))
        
        k2L1 = gx(t(i) + h/2,L1(i) + k1L1*h/2,L2(i) + k1L2*h/2)
        k2L2 = gz(t(i) + h/2,L1(i) + k1L1*h/2,L2(i) + k1L2*h/2)
        
        k3L1 = gx(t(i) + h/2,L1(i) + k2L1*h/2,L2(i) + k2L2*h/2)
        k3L2 = gz(t(i) + h/2,L1(i) + k2L1*h/2,L2(i) + k2L2*h/2)
        
        k4L1 = gx(t(i) + h,L1(i) + k3L1*h,L2(i) + k3L2*h)
        k4L2 = gz(t(i) + h,L1(i) + k3L1*h,L2(i) + k3L2*h)
        
        kL1 = (k1L1 + 2*k2L1 + 2*k3L1 + k4L1)/6
        kL2 = (k1L2 + 2*k2L2 + 2*k3L2 + k4L2)/6
        
        L1(i+1) = L2(i) + kL1*h
        L2(i+1) = L2(i) + kL1*h
        t(i+1) = t(i) + h
    end
endfunction

[t,L1,L2] = RK4(0,20,1,0,0)
plot(t,[L1,L2],'b')
