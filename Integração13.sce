function y=f(x)
    y=2./(x+8)
endfunction

function integral=Simpson13(a,b,n)
    h=(b-a)/(2*n)
    x=a:h:b
    y=f(x)
    
    soma=0
    for i=1:n
        soma = soma + y(2*i-1) + 4*y(2*i) + y(2*i+1)
    end
    integral=(h/3)*soma
endfunction

integral=Simpson13(1.8,3.2,1)

n=(((10^5)*(48./(1.8+8)^5)*((3.2-1.8)^5))/90)^(1/4)
n=2
