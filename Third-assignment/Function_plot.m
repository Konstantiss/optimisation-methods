clc 
clear

f = @(x,y) 0.5 * x^2 + 2 * y^2;

[x1,y1] = meshgrid(-4:0.1:4,-4:0.1:4);

z1 = 0.5 * x1^2 + 2 * y1^2;

figure(1)

fcontour(f)

figure(2)

surf(x1,y1,z1);

ezsurf(f);
