function eval = Eval(f,a,b,n)
    h = (b-a)/n;
    f =inline(f,'x');
    x = a:h:b;
    for ii=1:length(x)
        eval(ii) = feval(f,x(ii));
    end