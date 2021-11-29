clc 
clear

f = @(x,y) x^3 * exp(-x^2 - y^4);
[x1,y1] = meshgrid(-4:0.1:4,-4:0.1:4);
z1 = (x1.^3).*exp(-x1.^2-y1.^4);

figure(1)

fcontour(f)

figure(2)

surf(x1,y1,z1);



