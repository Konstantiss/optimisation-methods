clear
clc


l = 0.01:0.01:0.09;
functionCallsVaryingL = zeros(3,length(l));


for i=1:1:3
    for j=1:length(l)
        a = -4;
        b = 4;
        n = 0;
        while 0.5^n > (l(3) / (b - a))
            n = n + 1;
        end

        for k = 1:n
           x = (a + b) / 2;
           if funcDerivative(x,i) > 0
               b = x;
           elseif funcDerivative(x,i) < 0
               a = x;
           elseif funcDerivative(x,i) == 0
               k = n;
           end
           functionCallsVaryingL(i,j) = k;
           ak(i,k,j) = a;
           bk(i,k,j) = b;
           ks(i,k,j) = k;
        end
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
title('Function 1')
hold off

figure(5)
plot(ks(2,:,1), ak(2,:,1),'o', ks(2,:,1), bk(2,:,1),'x')
hold on
plot(ks(2,:,2), ak(2,:,2),'*', ks(2,:,2), bk(2,:,2),'>')
plot(ks(2,:,3), ak(2,:,3),'d', ks(2,:,3), bk(2,:,3),'<')
title('Function 2')
hold off

figure(6)
plot(ks(3,:,1), ak(3,:,1),'o', ks(3,:,1), bk(3,:,1),'x')
hold on
plot(ks(3,:,2), ak(3,:,2),'*', ks(3,:,2), bk(3,:,2),'>')
plot(ks(3,:,3), ak(3,:,3),'d', ks(3,:,3), bk(3,:,3),'<')
title('Function 3')
hold off
