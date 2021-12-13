function [z] = fxyGrad(x1,y1)
    syms x y
    f = 0.5*x^2 + 2*y^2;
    f1 = jacobian(f,[x,y]);
    z = vpa(subs(f1,[x,y],[x1,y1]));
end

