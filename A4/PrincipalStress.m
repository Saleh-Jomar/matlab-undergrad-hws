[V,D] = eig(S); 
for ii =1:length(S)
    Ps(ii) = D(ii,ii);
end
Pd = V'
Ps = Ps
