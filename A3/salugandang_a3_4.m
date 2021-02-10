A=[1 1 1; 10 28 40; 12*12 -30*8 18*10];
d=0:0.1:50;
z=zeros(length(A),length(d));
x=z;
Power=40;
[L,U,P] = LUGauss1(A);
ii=1;
for j=0:0.1:50
    z(:,ii)=[-40; (-j*Power);0];
    x(:,ii)= LUSolve(L,U,P,z(:,ii));
    ii=ii+1;
end
ii=1;
plot(x(ii,:),d);
figure;plot(x(ii+1,:),d,'r');
figure;plot(x(ii+2,:),d,'r');


