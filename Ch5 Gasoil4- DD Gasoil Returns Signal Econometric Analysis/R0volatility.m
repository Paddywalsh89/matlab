function sigma=volatility(s,n)
%Function to compute the volatility.
%Compute the log price differences.
for i=1:n-1
    ds(i)=log(s(i+1)/s(i));
end
ds(n)=ds(n-1);%Set end point value
%Compute first and second terms.
term1=sqrt(sum(abs(ds.*ds)));
term2=sum(ds)/sqrt(n);
%Return the volatility.
sigma=term1-term2;
 