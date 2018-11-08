function y=f(x)
    y=2./(x+8)
endfunction

function integral=Simpson38(a,b,n)
    h=(b-a)/(3*n)
    x=a:h:b
    y=f(x)
    
    soma=0
    for i=1:n
        soma = soma + y(3*i-2) + 3*y(3*i-1) + 3*y(3*i) + y(3*i+1)
    end
    integral=(3*h/8)*soma
endfunction

integral=Simpson38(1.8,3.2,1)
n=(3*((10^5)*(48./(1.8+8)^5)*((3.2-1.8)^5))/80)^(1/4)
n=2
