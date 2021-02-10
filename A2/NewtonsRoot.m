function[table1, sol, EAE] = NewtonsRoot(first, second, errore)
    error = 1;
    ie = 0;
    x = input('Initial guess: ');
    ii = 0;
    column1 = [ii x ie];
    T= table;
    
    while error > errore
        xii = x - feval(first, x)/feval(second, x);
        error = abs((xii - x));
        ii = ii+1;
        column = [ii xii error];
        column1 = [column1;column];
        x = xii; 
    end
    table1 = column1;
    sol = x;
    EAE = error;
end