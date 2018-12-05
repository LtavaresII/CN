y'''' = y''*e^t + (y''')^3
z = y', z' = y'', z'' = y''', z''' = y''''
z'''=z'*e^t+(z'')^3
w = z', w' = z'', w'' = z'''
w'' = w*e^t+(w')^3
v = w',v' = w''
v' = w*e^t+(v)^3
u = v'
u = w*e^t+(v)^3

v(0)=w(0)'=z''(0)=y'''(0) = 4
w(0) = z'(0)=y''(0)= 0
u= v' = w*e^t + v^3

function w = gz(t,w,v)
    w = 0
endfunction

function v = gw(t,w,v)
    v = 4
endfunction

function u = gw(t,w,v)
    u = w*e^t + v^3
endfunction
