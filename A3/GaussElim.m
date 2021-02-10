function x =GaussElim(A,b)
    g = 1;
    while g > 0
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
            A([prow(1) jj],:)= A([jj prow(1)],:);
            b([prow(1) jj],:)= b([jj prow(1)],:);

            for ii = (jj+1) : length(b)%2:6
                m=A(ii,jj)/A(jj,jj); %value of pivotfactor row2 = row2-mrow1
                A(ii,:)=A(ii,:)-m*A(jj,:); %row2= row2-mrow1
                b(ii)=b(ii)-m*b(jj); %also for b
            end
        end
        x = A\b
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
