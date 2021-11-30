clear
clc

l = 0.01:0.01:0.09;
functionCallsVaryingL = zeros(3,length(l));

for i=1:1:3
    e = 0.001;
    for j=1:length(l)
        a = -4;
        b = 4;
        k = 0;
        while (b - a) >= l(j)
           x1 = (a + b) / 2 - e;
           x2 = (a + b) / 2 + e;
           fx1 = funcChoose(x1,i);
           fx2 = funcChoose(x2,i);
           if fx1 < fx2
               b = x2;
           elseif fx1 > fx2
               a = x1;
           end
           k = k + 1;
           functionCallsVaryingL(i,j) = 2*k;
           ak(i,k,j) = a;
           bk(i,k,j) = b;
           ks(i,k,j) = k;
        end
    end
end

figure(1)
plot(l,functionCallsVaryingL(1,:))
title('Function 1 calls for different Ls')

figure(2)
plot(l,functionCallsVaryingL(2,:))
title('Function 2 calls for different Ls')

figure(3)
plot(l,functionCallsVaryingL(3,:))
title('Function 3 calls for different Ls')

figure(4)
plot(ks(1,:,1), ak(1,:,1),'o', ks(1,:,1), bk(1,:,1),'x')
hold on
plot(ks(1,:,2), ak(1,:,2),'*', ks(1,:,2), bk(1,:,2),'>')
plot(ks(1,:,3), ak(1,:,3),'d', ks(1,:,3), bk(1,:,3),'<')
title('Function 1 boundaries')
hold off

figure(5)
plot(ks(2,:,1), ak(2,:,1),'o', ks(2,:,1), bk(2,:,1),'x')
hold on
plot(ks(2,:,2), ak(2,:,2),'*', ks(2,:,2), bk(2,:,2),'>')
plot(ks(2,:,3), ak(2,:,3),'d', ks(2,:,3), bk(2,:,3),'<')
title('Function 2 boundaries')
hold off

figure(6)
plot(ks(3,:,1), ak(3,:,1),'o', ks(3,:,1), bk(3,:,1),'x')
hold on
plot(ks(3,:,2), ak(3,:,2),'*', ks(3,:,2), bk(3,:,2),'>')
plot(ks(3,:,3), ak(3,:,3),'d', ks(3,:,3), bk(3,:,3),'<')
title('Function 3 boundaries')
hold off

e = 0.0001:0.0001:0.0049;
functionCallsVaryingE = zeros(3,length(e));
for i=1:1:3
    l = 0.01;
    for j=1:length(e)
        a = -4;
        b = 4;
        k = 0;
        while (b - a) >= l
           x1 = (a + b) / 2 - e(j);
           x2 = (a + b) / 2 + e(j);
           fx1 = funcChoose(x1,i);
           fx2 = funcChoose(x2,i);
           if fx1 < fx2
               b = x2;
           elseif fx1 > fx2
               a = x1;
           end
           k = k + 1;
           functionCallsVaryingE(i,j) = 2*k;
           ak(i,k,j) = a;
           bk(i,k,j) = b;
           ks(i,k,j) = k;
        end
    end
end
functionCallsVaryingE
figure(7)
plot(e,functionCallsVaryingE(1,:))
title('Function 1 calls for different Es')

figure(8)
plot(e,functionCallsVaryingE(2,:))
title('Function 2 calls for different Es')

figure(9)
plot(e,functionCallsVaryingE(3,:))
title('Function 3 calls for different Es')



