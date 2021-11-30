clc
clear

e = 0.001;
gamma = 20;
xInitial = -1;
yInitial = -1;
k = 1;

x = xInitial;
y = yInitial;
results1(k) = fxy(x,y);

while norm(fxyGrad(x,y))>=e
    d = -fxyGrad(x,y);
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results1(k)=function1(x,y);
end

disp(x)
disp(y)
result1 = fxy(x,y);
kplot = 1:k;

figure (1)
plot(kplot,results1)
title("Steepest Descent - constant gamma="+gamma+"")
xlabel('Number of repetitions')
ylabel('f(x,y)')


k = 1;

x = xInitial;
y = yInitial;
results2(k) = fxy(x,y);

while norm(fxyGrad(x,y))>=e
    d = -fxyGrad(x,y);
    gamma = goldenSection(x,y,d);
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results2(k)=function1(x,y);
end

disp(x)
disp(y)
result2 = fxy(x,y);
kplot = 1:k;

figure (2)
plot(kplot,results2,'x')
title('Steepest Descent - Gamma found with Golden Section Method')
xlabel('Number of repetitions')
ylabel('f(x,y)')

k = 1;

x = yInitial;
y = xInitial;
results3(k) = fxy(x,y);

while norm(fxyGrad(x,y))>=e
    d = -fxyGrad(x,y);
    [x,y] = armijo(x,y,d);
    k = k+1;
    results3(k)=function1(x,y);
end

disp(x)
disp(y)
result3 = fxy(x,y);
kplot = 1:k;

figure (3)
plot(kplot,results3)
title('Steepest Descent - Armijo Rule')
xlabel('Number of repetitions')
ylabel('f(x,y)')