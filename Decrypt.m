function [ result ] = Decrypt( key, message )
the_key = key;
invdet = 0;
moddet = mod(det(the_key),92);
for i=1:93
    ll = moddet*i;
    llm = mod(ll,92);
    if  llm == 1
        invdet = i;
    end
end
adjmoddet = round(det(the_key) * inv(the_key));
modadj = mod(adjmoddet,92);
demes = mod(invdet*modadj,92);
lol = round(demes * message);
result = mod(lol,92);
end