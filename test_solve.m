x=[0:0.1:10];

a=tan(x/2);
b=tanh(x/2);
plot(x,a);
hold on;
plot(x,b);
S=solve(tan(alpha/2)+tanh(alpha/2) == 0,alpha)
