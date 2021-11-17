clear
clc

l = 0.01:0.01:0.03;
e = 0.001;
functionCallsVaryingL = zeros(3,length(l));


for i=1:1:3
    for j=1:length(l)
        a = -4;
        b = 4;
        n = 0;
        while fibonacci(n) <= ((b - a) / l(j))
            n = n + 1; 
        end
        x1 = a + (fibonacci(n - 2) / fibonacci(n)) * (b - a);
        x2 = a + (fibonacci(n - 1) / fibonacci(n)) * (b - a);
        fx1 = funcChoose(x1,i);
        fx2 = funcChoose(x2,i);
        functionCallsVaryingL(i,j) = functionCallsVaryingL(i,j) + 2;
        for k = 2:(n - 2)
           if fx1 > fx2
               a = x1;
               x1 = x2;
               x2 = a + (fibonacci(n - k - 1) / fibonacci(n - k)) * (b - a);
               fx1 = fx2;
               fx2 = funcChoose(x2,i);
           elseif fx1 < fx2
               b = x2;
               x2 = x1;
               x1 = a + (fibonacci(n - k - 2) / fibonacci(n - k)) * (b - a);
               fx2 = fx1;
               fx1 = funcChoose(x1,i);
           end
           functionCallsVaryingL(i,j) = functionCallsVaryingL(i,j) + 1;
           ak(i,k,j) = a;
           bk(i,k,j) = b;
           ks(i,k,j) = k;
        end
        x2 = x1 + e;
        fx2 = funcChoose(x2,i);
        functionCallsVaryingL(i,j) = functionCallsVaryingL(i,j) + 1;
        if fx1 > fx2
            a = x1;
        else
            b = x1;
        end
        ak(i,k,j) = a;
        bk(i,k,j) = b;
    end
end
functionCallsVaryingL
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
