function x = LUSolve(L,U,P,b)
        b1=P*b;
        y = L\b1;
        x = U\y;
end
