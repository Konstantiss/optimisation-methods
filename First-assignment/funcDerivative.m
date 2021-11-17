function y = funcChoose(x,i)
    syms z;
    if i==1
        f = (z-3)^2 + sin(z+3)^2;
        derivative = diff(f);
        y = vpa(subs(derivative,z,x));
    elseif i==2
        f = (z-1) * cos(0.5*z) + z^2;
        derivative = diff(f);
        y = vpa(subs(derivative,z,x));
    elseif i==3
        f = (z+2)^2 + exp(z-2) * sin(z+3);
        derivative = diff(f);
        y = vpa(subs(derivative,z,x));
    else
        y = NaN
    end
end
