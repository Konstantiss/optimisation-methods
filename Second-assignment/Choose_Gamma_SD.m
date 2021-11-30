clear
clc

e=0.001;
xInitial = -1;
yInitial = -1;
gStart = 0.1;
gEnd = 1.15;
gStep = 0.05;

lengthG = length(gStart:gStep:gEnd);
repetitions = zeros(lengthG,1);
i=1;

for gamma=gStart:gStep:gEnd
    k=0;
    x = xInitial;
    y = yInitial;
    while norm(fxyGrad(x,y))>=e
        d = -fxyGrad(x,y);
        x = x + gamma*d(1);
        y = y + gamma*d(2);
        k = k+1;
    end
    repetitions(i) = k;
    i=i+1;
end

pos = find(repetitions==min(repetitions));
best = 0.1+(pos(1)-1)*0.05;
disp(best)

g_plot=gStart:gStep:gEnd;
plot(g_plot,repetitions)
