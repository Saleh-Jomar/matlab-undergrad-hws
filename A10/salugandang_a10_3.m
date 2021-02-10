px=input('Equation for p(x): ', 's');
qx=input('Equation for q(x): ', 's');
rx=input('Equation for r(x): ', 's');


p = Eval(px,1,3,50);
q = Eval(qx,1,3,50);
r = Eval(rx,1,3,50);

[xy]=BVPFDM(1,3,1,-1.2,50,p,q,r)