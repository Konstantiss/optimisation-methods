function y = funcDerivative(x,i)
    if i==1
        y = 2*x + 2*cos(x + 3)*sin(x + 3) - 6;
    elseif i==2
        y = 2*x + cos(x/2) - (sin(x/2)*(x - 1))/2;
    elseif i==3
        y = 2*x + cos(x + 3)*exp(x - 2) + sin(x + 3)*exp(x - 2) + 4;
    else
        y = NaN
    end
end