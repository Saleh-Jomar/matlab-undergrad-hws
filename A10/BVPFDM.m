function [xy]=BVPFDM(a,b,c,s,n,px,qx,rx)
    h=(b-a)/n;
    x=(a:h:b)';
    m=length(x);
    M =zeros(m,m);
    jj=1;
    k=0;
    for ii=1:m
        if ii==1
            M(ii,1) = -2/h^2 +qx(2);
            M(ii,2) = 1/h^2 + px(2)/(2*h);
            rx(ii)=rx(2)+px(2)*c/(2*h)-c/h^2;
        elseif ii==m
            M(ii,ii-2)= -1/(2*h);
            M(ii,ii) = 1/(2*h);
            rx(ii)=s;
        else
            M(ii,jj)=1/h^2 -px(3+k)/(2*h);
            M(ii,jj+1)=-2/h^2 +qx(3+k);
            M(ii,jj+2)=1/h^2 +px(3+k)/(2*h);
            k=k+1;
            jj=jj+1;
        end
    end
    y1=M\rx';
    y1(m)=[];
    y = [c(1);y1];
    xy=[x y];
    
    plot(x,y)
end
            
            
