clear
clc

g = 1;
while g > 0
    A = input('Give the matrix []: ');
    b = input('Give b here []: ');
    U1=A;
    I=eye(length(b));
    %for components of U
    for jj = 1:(length(b)-1) %length of elements 1:5
        if jj == 1
        else
            s(jj-1)=Inf;
        end

        for ii = jj:length(b) %jj:6 so basically per column
            s(ii) = max(abs(U1(ii,:))); %getting max per row put into row vector overall
        end
        p = abs(U1(:,jj))./s'; %dividing each row of max per column jj by max s

        prow = find(p==max(p)); %gives what row
        U1([prow(1) jj],:)= U1([jj prow(1)],:); %exchange rows
        b([prow(1) jj],:)= b([jj prow(1)],:);
        
        for ii = (jj+1) : length(b)%2:6
            m=U1(ii,jj)/U1(jj,jj); %value of pivotfactor row2 = row2-mrow1
            I(ii,jj) = m;
            U1(ii,:)=U1(ii,:)-m*U1(jj,:); %row2= row2-mrow1          
        end  
    end
    U = U1
    L = I  %for components of L
    y = L\b;
    x = U\y
    
    prompt ='Input another matrix? Y/N: ';
    n1 = input(prompt, 's');
    n2 = upper(n1);
    if strcmp(n2, 'N')
        g= 0;
    end
    if isempty(n2)
        g = 0;
    end
end
