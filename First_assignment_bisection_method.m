l = 0.01:0.01:0.05;
ak = zeros(3,length(l));
bk = zeros(3,length(l));
ks = zeros(3,length(l));



for i=1:1:3
    a = -4;
    b = 4;
    e = 0.001;
    k = 0;
    for j=1:1:length(l)
        while (b - a) >= l(j)
           x1 = (a + b) / 2 - e;
           x2 = (a + b) / 2 + e;

           if funcChoose(x1,i) < funcChoose(x2,i)
               b = x2;
           else
               a = x1;
           end
           k = k + 1;
           ak(i,k) = a;
           bk(i,k) = b;
           ks(i,k) = k;
        end
    end
end


figure(1)
plot(ks(1,:), ak(1,:),'o', ks(1,:), bk(1,:),'x')
hold on
plot(ks(2,:), ak(2,:),'o', ks(2,:), bk(2,:),'x')
plot(ks(3,:), ak(3,:),'o', ks(3,:), bk(3,:),'x')
hold off


