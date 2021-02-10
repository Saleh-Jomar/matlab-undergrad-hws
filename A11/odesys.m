function [K1,K2,K3,K4] = odesys(fxn,x,y,h)
   K1=fxn(x,y);
   K2=fxn(x+0.5*h,y+0.5*K1*h);
   K3=fxn(x+0.5*h,y+0.5*K2*h);
   K4=fxn(x+h,y+K3*h);
end