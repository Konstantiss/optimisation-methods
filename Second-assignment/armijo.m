function [xNew,yNew] = armijo(x,y,d)
    s=1; a=0.01; b=0.3; m=0;
    gamma = s*b^m;
    xNew = x +gamma*d(1);
    yNew = y +gamma*d(2);
    test1 = fxy(x,y);
    test2 = fxy(xNew,yNew);
    
    while (test1-test2)<(-a*(b^m)*s*d'*fxyGrad(x,y))
        m = m+1;
        gamma = s*b^m;
        xNew = x +gamma*d(1);
        yNew = y +gamma*d(2);
        test2 = fxy(xNew,yNew);
    end
end

