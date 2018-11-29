function z = gs(t,s,v)
    z = v;
endfunction

function z = gv(t,s,v)
    z = -10;
endfunction

function [t,s,v] = pontoMedioSistema(a,b,h,s0,v0)
    t = a:h:b
    n = length(t);
    s(1) = s0
    v(1) = v0
    
    for i = 1:n-1
        k1s = gs(t(i),s(i),v(i))
        k1v = gv(t(i),s(i),v(i))
        
        k2s = gs(t(i) + h/2,s(i) + k1s*h/2,v(i) + k1v*h/2)
        k2v = gv(t(i) + h/2,s(i) + k1s*h/2,v(i) + k1v*h/2)
        
        s(i+1) = s(i) = k2s*h;
        v(i+1) = v(i) = k2v*h;
    end
endfunction

[t,s,v] = pontoMedioSistema(0,2,0.2,1.8,12)
