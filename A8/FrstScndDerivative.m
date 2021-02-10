function [yd, ydd] = FrstScndDerivative(x,f)
    h = x(2)-x(1);
    for ii = 1:length(x)
        if ii == 1
            fdd(ii)= (f(ii+1)-f(ii))/h;
        elseif ii== length(x)
            fdd(ii)= (f(ii)-f(ii-1))/h;
        else
            fdd(ii) = (f(ii+1)-f(ii-1))/(2*h);
        end
    end
    yd =fdd';
    %Second Deriv
    for ii=1:length(x)
        if ii == 1
            sdd(ii)= (f(ii+2)-2*f(ii+1)+f(ii))/h^2;
        elseif ii == length(x)
            sdd(ii)=(f(ii)-2*f(ii-1)+f(ii-2))/h^2;
        else
            sdd(ii)=(f(ii+1)-2*f(ii)+f(ii-1))/h^2;
        end
    end
    ydd = sdd';
end
