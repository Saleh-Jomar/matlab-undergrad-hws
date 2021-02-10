function Inte = GaussS(n, y,a,b)
    fact=factorial(n);
    syms x
    Fxn=(x^2-1)^n;
    deriv=diff(Fxn,x,n);
    l =1/((2^n)*fact)*deriv;
    l=simplify(l)
    p =input('Input coefficients of the equation obtained from highest to lowest degree of x in vector form: ');
    r=roots(p);

    for jj=1:n
        for ii=1:n
            M(ii,jj) =(r(jj))^(ii-1);
        end
    end

    bv=zeros(n,1);
    for ii=1:2:n
        bv(ii)=2/ii;
    end
    bv = bv;
    W=M\bv;

    c = inline(y,'x'); 
    for ii=1:n
        u(ii) = ((b-a)/2*r(ii)+(a+b)/2);
        F(ii)=feval(c, u(ii));
        g(ii)=F(ii)*(b-a)/2;
    end

    Int =0;
    for ii=1:n
        Int = W(ii)*g(ii)+Int;
    end

    Inte=Int;
end




