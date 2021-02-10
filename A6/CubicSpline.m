function [q] = CubicSpline(A)
    x = A(:,1);
    y= A(:,2);
    n = length(x);
    Pi=zeros(4*n-4,4*n-4);

    kk=0;
    bb=0;
    for ii =1:2:(2*n-2)
        for mm = 1:2
            for jj=1 :4
                if jj == 4
                    Pi(ii,kk+jj) = 1;
                else
                    Pi(ii,kk+jj)=(x(bb+mm))^(jj);
                end
            end
             ii=ii+1;
        end
        bb=bb+1;
        kk=kk+4;
     end

    ll = 0;
    oo =0;
    for ii=(2*n-1):(3*n-4)
        for jj=1:7
            if jj ==4
                Pi(ii,jj+ll)=0;
            elseif jj ==2
                Pi(ii,jj+ll)=2*x(2+oo);
            elseif jj ==1
                Pi(ii,jj+ll)=1;
            elseif jj ==6
                Pi(ii,jj+ll)=-2*x(2+oo);
            elseif jj ==5
                Pi(ii,jj+ll)=-1;
            elseif jj ==3
                Pi(ii,jj+ll)=3*(x(2+oo))^2;
            elseif jj ==7
                Pi(ii,jj+ll)=-3*(x(2+oo))^2;
            end
        end
        ll =ll+4;
        oo= oo+1;
    end
    ll = 0;
    oo =0;
    for ii=(3*n-3):(4*n-6)
        for jj=1:7
            if jj ==2
                Pi(ii,jj+ll)=2;
            elseif jj ==6
                Pi(ii,jj+ll)=-2;
            elseif jj ==3
                Pi(ii,jj+ll)=6*x(2+oo);
            elseif jj ==7
                Pi(ii,jj+ll)=-6*x(2+oo);
            end
        end
        ll =ll+4;
        oo= oo+1;
    end
    
    Pi((4*n-5),3)=6*x(1);
    Pi((4*n-5),2)=2;
    Pi((4*n-4),(4*n-3))=6*x(n);
    Pi((4*n-4),(4*n-2))=2;
    
    nn=2;
    for ii = 1:(4*n-4)
        if ii == 1 
            b(ii)=y(ii);
        elseif ii ==(2*n-2) 
            b(ii)= y(n);
        elseif ii>(2*n-2)
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
            d(ii)= (a(3+jj)+a(jj)*z+a(1+jj)*(z).^2+a(jj+2)*(z).^3);
            jj =jj+4;
            if x(ii)<z && x(ii+1)>z
                k =ii;
            end
        end
        d =d(k);
    end

    q=@P;
end
