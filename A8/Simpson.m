function [Integral] = Simpson(x,y)
    h = x(2)-x(1);
    n = rem(length(x)-1,3);
    %trapezoidal
    if n == 1
        I(1) = (y(1)+y(2))*(x(2)-x(1))/2;
        jj = 2;
        for ii = 2:floor((length(x)-1)/3)+1
            I(ii)=3/8*h*(y(jj)+3*y(jj+1)+3*y(jj+2)+y(jj+3));
            jj = jj+3;
        end
    end

    %1/3 Simpsons
    if n == 2
        I(1) = h/3*(y(1)+4*y(2)+y(3));
        jj = 3;
        for mm = 2:floor((length(x)-1)/3)+1
            I(mm)=3/8*h*(y(jj)+3*y(jj+1)+3*y(jj+2)+y(jj+3));
            jj = jj+3;
        end
    end

    %all 3/8
    if n==0
        jj = 1;
        for ii = 1:floor((length(x)-1)/3)
            I(ii)=3/8*h*(y(jj)+3*y(jj+1)+3*y(jj+2)+y(jj+3));
            jj = jj+3;
        end
    end
    
    Integral =sum(I);
end
