%test_solve_2
%syms x
%interval = [solx > 0, solx < 4*pi]
%assume(x, 'real')
%vpasolve(tan(x/2)+tanh(x/2) == 0,x, [0.1,4*pi])

syms x 
f = tan(x/2)+tanh(x/2);
for n = 1:3
  solx=vpasolve(f,x,[0.1,8*pi],'Random',true) 
  S=solx
end