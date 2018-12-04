function [x,y] = EulerInteracao(x,y,h,n)
    for i = 1:n
        y = y + h*g(x,y)
        x = x + h
    end
endfunction

function [h] = EulerPasso(x,y,h,E)
    [x,yAtual] = EulerInteracao(x,y,h,1)
    [x,yNovo] = EulerInteracao(x,y,h/2,2)
    Erro = abs(yNovo-yAtual)
    if (Erro >= E)
        h = h*(E/Erro)^0.25
    else
        h = h*(E/Erro)^0.2
    end
endfunction

function [x,y] = EulerAdaptado(a,b,h,y0,E)
    x(1) = a
    y(1) = y0
    i = 1;
    while (%T)
        h = EulerPasso(x(i),y(i),h,E)
        [x(i+1),y(i+1)] = EulerInteracao(x(i),y(i),h,1)
        if (x(i+1) > b)
            break;
        end
        i = i+1
    end
endfunction

[xEa,yEa] = EulerAdaptado(a,b,h,y0,E)
plot(xEa,yEa,'b')
