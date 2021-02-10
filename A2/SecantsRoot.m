function[table1, sol, EAE] = SecantsRoot(first, errore)
    error = 1;
    x = input('First starting guess: ');
    xo = input('Second guess: ');
    ii = 0;
    column1 = [[-1 x 0];[ii xo abs((x - xo)/xo)]];
    while error > errore
        xi = xo - (feval(first, xo))*(x-xo)/(feval(first, x)-feval(first,xo));
        error = abs((xi - xo))/xi;
        ii = ii + 1;
        column = [ii xi error];  
        column1 = [column1;column];
        xo = xi; 
    end
    table1 = column1;
    sol = xo;
    EAE = error;
end