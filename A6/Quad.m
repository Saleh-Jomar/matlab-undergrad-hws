function [q] = Quad(A)
    x = A(:,1);
    y= A(:,2);
    n = length(x);
    Pi=zeros(3*n-3,3*n-3);

    kk=0;
    bb=0;
    for ii =1:2:(2*n-2)
        for mm = 1:2
            for jj=1 :3 
                if jj == 3
                    Pi(ii,kk+jj) = 1;
                else
                    Pi(ii,kk+jj)=(x(bb+mm))^(jj);
                end
            end
             ii=ii+1;
        end
        bb=bb+1;
        kk=kk+3;
     end

    ll = 0;
    oo =0;
    for ii=(2*n-1):(3*n-4)
        for jj=1:5
            if jj ==3
                Pi(ii,jj+ll)=0;
            elseif jj ==2
                Pi(ii,jj+ll)=2*x(2+oo);
            elseif jj ==1
                Pi(ii,jj+ll)=1;
            elseif jj ==5
                Pi(ii,jj+ll)=-2*x(2+oo);
            elseif jj ==4
                Pi(ii,jj+ll)=-1;
            end
        end
        ll =ll+3;
        oo= oo+1;
    end
    Pi(3*n-3,2)=2;
    Pi=Pi;

    nn=2;
    for ii = 1:(3*n-3)
        if ii == 1 %correct
            b(ii)=y(ii);
        elseif ii ==(2*n-2) %correct
            b(ii)= y(n);
        elseif ii>(2*n-2)%correct
            b(ii) = 0;
        elseif ii == 2
            for ee=2:(2*n-2)
                if ee ~=(2*n-2) && mod(ee,2)==0
                    for jj=1:2
                        b(nn)=y(ii);
                        nn=nn+1;
                    end
                    ii=ii+1;
                end
            end
        end
    end
    b=b';
    a =(Pi\b);
    
    function d = P(z)
        jj =1; 
        for ii =1:n-1
            d(ii)= (a(2+jj)+a(jj)*z+a(1+jj)*(z).^2);
            jj =jj+3;
            if x(ii)<z && x(ii+1)>z
                k =ii;
            end
        end
        d =d(k);
    end

    q=@P;
end
