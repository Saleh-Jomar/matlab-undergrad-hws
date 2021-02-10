clear
clc

g = 1;
while g > 0
    A = input('Give the matrix []: ')
    b = input('Give b here []: ')
    x = A\b
    for jj = 1:(length(b)-1) %length of elements 1:5
        if jj == 1
        else
            s(jj-1)=Inf;
        end

        for ii = jj:length(b) %jj:6 so basically per column
            s(ii) = max(abs(A(ii,:))); %getting max per row
        end
        p = abs(A(:,jj))./s'; %dividing each row of column by max s

        pivotfactor = find(p==max(p));
        col = A(jj,:);
        A(jj,:) = A(pivotfactor(1),:);
        A(pivotfactor(1),:) = col;
        col = b(jj);
        b(jj) = b(pivotfactor(1));
        b(pivotfactor(1)) = col;

        for ii = (jj+1) : length(b)
            m(ii,jj)=A(ii,jj)/A(jj,jj);
            A(ii,:)=A(ii,:)-m(ii,jj)*A(jj,:);
            b(ii)=b(ii)-m(ii,jj)*b(jj);
        end
    end
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
