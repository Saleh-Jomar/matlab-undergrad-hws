y = input('Give the equation: ', 's');
error = input('True relative error: ');
a = inline(y,'x');

[answer, sol, EAE] = SecantsRoot(a, error)