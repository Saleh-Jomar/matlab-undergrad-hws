function [x,y]= odesysRK4(ode_sys,dom,N,y_init)
    c=input('dydx RHS equation in x and y: ','s');
    dydx= inline(c,'x','y');
    h=(dom(2)-dom(1))/(N-1);
    x=dom(1):h:dom(2);
    y(1)=y_init;
    for ii=1:N
        [K1,K2,K3,K4]=ode_sys(dydx,x(ii),y(ii),h);
        y(ii+1) = y(ii) +1/6*(K1+2*K2+2*K3+K4)*h;
    end
end
    