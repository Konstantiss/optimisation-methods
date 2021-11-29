function [gammaMin] = goldenSection(x,y,d)
    l = 0.1;
    a = -4;
    b = 4;
    gammaInitial = 0.618;
    k = 1;
    x1 = a + (1 - gammaInitial) * (b - a);
    x2 = a + gammaInitial * (b - a);
    fx1 = fxyGamma(x,y,d,x1);
    fx2 = fxyGamma(x,y,d,x2);
    while (b - a) >= l
        if fx1 > fx2
               a = x1;
               x1 = x2;
               x2 = a + gammaInitial * (b - a);
               fx1 = fx2;
               fx2 = fxyGamma(x,y,d,x2);
        elseif fx1 < fx2
               b = x2;
               x2 = x1;
               x1 = a + (1 - gammaInitial) * (b - a);
               fx2 = fx1;
               fx1 = fxyGamma(x,y,d,x1);
        end
    end
    gammaMin = (a+b)/2;
end