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
        kL1 = gL1(t(i),L1(i),L2(i))
        kL2 = gL2(t(i),L1(i),L2(i))
        L1(i+1) = L1(i) + kL1*h
        L2(i+1) = L2(i) + kL2*h
    end
endfunction

[t,L1,L2] = eulerSistema(0,30,1,0,0)
