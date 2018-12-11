x=[0:0.1:30];

a=tan(x/2);
b=-tanh(x/2);
plot(x,a);
hold on;
plot(x,a,'red');
plot(x,b,'blue');
%S=solve(tan(alpha/2)+tanh(alpha/2) == 0,alpha)
