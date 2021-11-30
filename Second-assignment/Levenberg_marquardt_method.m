clc
clear

e = 0.001;
gamma = 1;
xInitial = -1.2;
yInitial = -0.8;
k = 1;

x = xInitial;
y = yInitial;
results1(k) = fxy(x,y); 

grad = fxyGrad(x,y);