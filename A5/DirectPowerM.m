function e1 = DirectPowerM(S)
    u =[1;2;3];
    EAE =100;
    EREmax = 0.001;
    it=0;
    i=0;
    while EAE > EREmax
        w = S*u;
        e1 = max(abs(w));
        e2 = i;
        i =e1;
        u=w/i;
        if it == 0
            it = it+1;
        else
            EAE = abs((i-e2));
            it = it+1;
        end   
    end
end
