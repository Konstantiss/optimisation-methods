clc
clear

e = 0.01;
gamma = [0.05];
xInitial = 7;
yInitial = 4;
k = 1;

x = xInitial;
y = yInitial;

for i = 1:length(gamma)
    x = xInitial;
    y = yInitial;
    results(i,k) = fxy(x,y);
    while norm(fxyGrad(x,y)) >= e
        d = -fxyGrad(x,y);
        x = x + gamma(i)*d(1);
        y = y + gamma(i)*d(2);
        k = k+1;
        results(i,k)=fxy(x,y);
    end
    disp(x)
    disp(y)
    kplot = 1:k;
    figure (i)
    plot(kplot,results(i,1:k))
    title("Steepest Descent - constant gamma="+gamma(i)+", Starting point: ("+xInitial+","+yInitial+")")
    xlabel('Number of repetitions')
    ylabel('f(x,y)')
    k = 1;
end



