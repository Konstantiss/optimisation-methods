clc
clear

e = 0.001;
gamma = 0.6;
xInitial = -1.2;
yInitial = -0.8;
k = 1;

x = xInitial;
y = yInitial;
results1(k) = fxy(x,y); 

grad = fxyGrad(x,y);

while norm(grad) >= e
    h = fxyHessian(x,y);
    m = 0;
    H = h + m * eye(size(h));
    while H(1,1)<=0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<=0
        m = m + 1;
        H = h + m * eye(size(h));
    end
    d = -grad / H;
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results1(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result1 = function1(x,y);
kplot = 1:k;

figure (1)
plot(kplot,results1)
title("Levenberg-Marquardt - constant gamma="+gamma+"")
xlabel('Number of repetitions')
ylabel('f(x,y)')


k = 1;

xInitial = 1;
yInitial = 1;

x = xInitial;
y = yInitial;
results2(k) = fxy(x,y); 

grad = fxyGrad(x,y);

while norm(grad) >= e
    h = fxyHessian(x,y);
    m = 0;
    H = h + m * eye(size(h));
    while H(1,1)<=0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<=0
        m = m + 1;
        H = h + m * eye(size(h));
    end
    d = -grad / H;
    gamma = goldenSection(x,y,d);
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results2(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result2 = fxy(x,y);
kplot = 1:k;

figure (2)
plot(kplot,results2,'x')
title('Levenberg-Marquardt - gamma found with Golden Section Method')
xlabel('Number of repetitions')
ylabel('f(x,y)')


k = 1;

x = xInitial;
y = yInitial;
results3(k) = fxy(x,y); 

grad = fxyGrad(x,y);

while norm(grad) >= e
    h = fxyHessian(x,y);
    m = 0;
    H = h + m * eye(size(h));
    while H(1,1)<=0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<=0
        m = m + 1;
        H = h + m * eye(size(h));
    end
    d = -grad / H;
    [x,y] = armijo(x,y,d);
    k = k+1;
    results3(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result3 = fxy(x,y);
kplot = 1:k;

figure (3)
plot(kplot,results3)
title('Levenberg-Marquardt - Armijo Rule')
xlabel('Number of repetitions')
ylabel('f(x,y)')
