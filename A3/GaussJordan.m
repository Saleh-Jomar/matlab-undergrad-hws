function x=GaussJordan(A,b)
    g = 1;
    while g > 0
       
        c = length(b);
        I =eye(c);
        for jj = 1:(length(b)-1) %length of elements 1:5
            if jj == 1
            else
                s(jj-1)=Inf;
            end

            for ii = jj:length(b) %jj:6 so basically per column
                s(ii) = max(abs(A(ii,:))); %getting max per row put into row vector overall
            end
            p = abs(A(:,jj))./s'; %dividing each row of max per column jj by max s

            prow = find(p==max(p)); %gives what row
            A([prow(1) jj],:)= A([jj prow(1)],:); %exchange rows
            I([prow(1) jj],:)= I([jj prow(1)],:);
            b([prow(1) jj],:)= b([jj prow(1)],:);

            for ii = (jj+1) : length(b)%2:6
                m=A(ii,jj)/A(jj,jj); %value of pivotfactor row2 = row2-mrow1
                A(ii,:)=A(ii,:)-m*A(jj,:); %row2= row2-mrow1
                b(ii)=b(ii)-m*b(jj); %also for b
                I(ii,:)=I(ii,:)-m*I(jj,:);
            end  
        end

        %getting the diagonal values 
        for ii = 1:length(b) %jj:6 so basically per column
            s1(ii) = A(ii,ii); 
        end
            %dividing each row by corresponding s1(ii)

        A2 = bsxfun(@rdivide,A,s1(:));
        I2 = bsxfun(@rdivide,I,s1(:));
        b2 =b./s1';
        mm = 1;
        while mm < length(b)
            for ii = 1:mm
                m2 = A2(ii,mm+1)/A2(mm+1,mm+1);
                A2(ii,:)= A2(ii,:)-m2*A2(mm+1,:);
                I2(ii,:)= I2(ii,:)-m2*I2(mm+1,:);
                b2(ii)=b2(ii)-m2*b2(mm+1);
            end
            mm = mm + 1 ;
        end
        x = b2
        Inverse=I2

        prompt ='Input another matrix? Y/N: ';
        n1 = input(prompt, 's');
        n2 = upper(n1);
        if strcmp(n2, 'N')
            g= 0;
        elseif isempty(n2)
            g = 0;
        else
            A = input('Give the matrix []: ');
            b = input('Give b here []: ');
        end
    end
end
