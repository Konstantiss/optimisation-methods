clc
clear

e = 0.01;
gamma = 0.1;
xInitial = 17;
yInitial = -5;
k = 1;
s = 0.5;

x = xInitial;
y = yInitial;
results(k) = fxy(x,y);

jacob = fxyGrad(x,y);
while norm(jacob) >= e
    projectionXInput = x - s*jacob(1);
    projectionYInput = y - s*jacob(2);
    [xHat,yHat] = projection(projectionXInput,projectionYInput);
    x = x + gamma*(xHat - x);
    y = y + gamma*(yHat-y);
    jacob = fxyGrad(x,y);
    k = k+1;
    results(k)=fxy(x,y);
end
kplot = 1:k;
figure (1)
plot(kplot,results)
title("Steepest Descent Projection, Starting point: ("+xInitial+","+yInitial+")")
xlabel('Number of repetitions')
ylabel('f(x,y)')
