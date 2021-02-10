function f = Interpolant(A)
    [r,c]=size(A);
    x = A(:,1);
    y= A(:,2);
    for ii=1 : r
        for jj=1: r
            if jj == 1
                M(ii,jj) = 1;
            else
                M(ii,jj)=(x(ii))^(jj-1);
            end
        end
    end
    a = M\y

    function d = P(z)
        d= a(1)+a(2)*z+a(3)*(z).^2
    end

    f=@P;
end    