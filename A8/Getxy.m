function [x,y,t] = Getxy(interval)
    h=7/interval;
    ii =1;
    for t=-4:h:3
        x(ii)=(2.5-0.3*t^2)*cos(t);
        y(ii) =(3.3-0.4*t^2)*sin(t);
        ii=ii+1;
    end
    t= -4:h:3;
end