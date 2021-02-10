x = input('Give the equation: ', 's');
y = input('Give the first derivative of equation: ', 's'); 
errore = input('Absolute error: ');
a = inline(x,'x');
b = inline(y, 'x');

[answer, sol, EAE] = NewtonsRoot(a, b, errore)