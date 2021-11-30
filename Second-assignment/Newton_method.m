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

while norm(grad) >= e
    H = fxyHessian(x,y);
    eigenValues = eig(H);
    if H(1,1)<0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<0
        disp('The hessian is not positive definite - Error')
        break
    end
    H = inv(H);
    d = -H * grad';
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results1(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result1 = fxy(x,y);
kplot = 1:k;

if k>1
    figure (1)
    plot(kplot,results1,'x')
    title("Newton - constant gamma="+gamma+"")
    xlabel('Number of repetitions')
    ylabel('f(x,y)')
end


k = 1;

x = xInitial;
y = yInitial;
results2(k) = fxy(x,y); 

grad = fxyGrad(x,y);

while norm(grad) >= e
    H = fxyHessian(x,y);
    eigenValues = eig(H);
    if H(1,1)<0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<0
        disp('The hessian is not positive definite - Error')
        break
    end
    H = inv(H);
    d = -H * grad';
    gamma = goldenSection(x,y,d);
    x = x + gamma*d(1);
    y = y + gamma*d(2);
    k = k+1;
    results2(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result2 = fxy(x,y);
kplot = 1:k;

if k>1
    figure (2)
    plot(kplot,results2,'x')
    title("Newton - gamma calculated with Golden section method")
    xlabel('Number of repetitions')
    ylabel('f(x,y)')
end

k = 1;

x = xInitial;
y = yInitial;
results3(k) = fxy(x,y); 

grad = fxyGrad(x,y);

while norm(grad) >= e
    H = fxyHessian(x,y);
    eigenValues = eig(H);
    if H(1,1)<0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<0
        disp('The hessian is not positive definite - Error')
        break
    end
    H = inv(H);
    d = -H * grad';
    [x,y] = armijo(x,y,d);
    k = k+1;
    results3(k)=fxy(x,y);
    grad = fxyGrad(x,y);
end

result3 = fxy(x,y);
kplot = 1:k;

if k>1
    figure (3)
    plot(kplot,results3,'x')
    title("Newton - Armijo Rule")
    xlabel('Number of repetitions')
    ylabel('f(x,y)')
end
