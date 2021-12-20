clc 
clear

f = @(x,y) 0.5 * x^2 + 2 * y^2;


figure(1)

fcontour(f)

figure(2)

ezsurf(f);
