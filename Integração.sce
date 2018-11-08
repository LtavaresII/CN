function y=f(x)
    y=2./(x+8)
endfunction

function integral=Trapezio(a,b,n)
    h=(b-a)/n
    x=a:h:b
    y=f(x)
    
    I=y(1)
    for i=2:n
        I=I + 2*y(i)
    end
    integral=(h/2)*(I+y(n+1))
endfunction

integral=Trapezio(1.8,3.2,10)

n=((10^5)*(4./(1.8+8)^3)*((b-a)^2))/12
n=70