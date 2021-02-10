clc
clear
interval = input('Number of intervals: ');
[x,y,t] = Getxy(interval);
[fdx,sdx]=FrstScndDerivative(t,x);
[fdy,sdy]=FrstScndDerivativet,y);
for i=1:length(t)
    fxn(i) = ((fdx(i))^2+(fdy(i))^2)^0.5;
end
Integral =Simpson(t,fxn)