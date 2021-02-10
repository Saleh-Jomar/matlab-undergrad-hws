function x = GaussSeidel(A,b,EREmax)
    for ii=1:length(b)
        if abs(A(ii,ii))<sum(abs(A(ii,:)))-A(ii,ii)
            display('Not diagonally dominant')        
            break
        end
        if ii==length(b) && abs(A(ii,ii))>(sum(abs(A(ii,:)))-A(ii,ii))
            display('Diagonally dominant')
        end
    end
    x=zeros(1,length(b)); 

    for ii=1:20 
        for ii=1:length(b)
            body=b; 
            for jj=1:length(b) 
                if ii~=jj
                    body(ii)=body(ii)-A(ii,jj)*x(jj); 
                end
            end
            x1 = x;
            x(ii)=body(ii)/A(ii,ii);
        end
        ERE(ii)=abs(((x(ii)-x1(ii))/x1(ii))*100);
        if ERE(1:length(b))<EREmax 
            break
        end
    end
end