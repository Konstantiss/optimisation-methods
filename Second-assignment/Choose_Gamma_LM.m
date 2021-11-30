clear
clc

e=0.001;
xInitial = -1;
yInitial = -1;
gStart = 0.1;
gEnd = 10;
gStep = 0.05;

lengthG = length(gStart:gStep:gEnd);
repetitions = zeros(lengthG,1);
i=1;

for gamma=gStart:gStep:gEnd
    k=0;
    x = xInitial;
    y = yInitial;
    test = function2(x,y);
    while norm(test)>=e
        h = hessiani(x,y);
        m=0;
        H = h+m*eye(size(h));
        while H(1,1)<=0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<=0
            m = m+1;
            H = h+m*eye(size(h));
        end
        d = -test/H;
        x = x+gamma*d(1);
        y = y+gamma*d(2);
        test = function2(x,y);
        k = k+1;
    end
     if function1(x,y)>-0.4 %lines 31,32,33 and 35 need to be comments if we are beginning from (1,1)
         repetitions(i) = 20.5;
     else
        repetitions(i) = k;
     end
    i=i+1;
end
pos = find(repetitions==min(repetitions));
best = 0.1+(pos(1)-1)*0.05;
disp(best)

g_plot=gStart:gStep:gEnd;
plot(g_plot,repetitions,'x')