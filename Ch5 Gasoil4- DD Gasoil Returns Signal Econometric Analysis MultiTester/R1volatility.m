function sigma=R1volatility(data,N)
%Function to compute the volatility.
%Compute the log price differences.
%for i=2:N-1
    for i=2:N
    ds(i)=log(data(i)/data(i-1));
end
ds(N)=ds(N-1);%Set end point value
%Compute first and second terms.
term1=sqrt(sum(abs(ds.*ds)));
term2=sum(ds)/sqrt(N); %%I think that this should be N-1 according to JMB paper…
%Return the volatility.
sigma=term1-term2;
 