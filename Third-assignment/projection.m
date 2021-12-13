function [x,y] = projection(x,y)
    ax=-15; bx=15;
    ay=-20; by=12;
    if x<=ax
        x=ax;
    elseif x>=bx
        x=bx;
    end
    if y<=ay
        y=ay;
    elseif y>=by
        y=by;
    end
end