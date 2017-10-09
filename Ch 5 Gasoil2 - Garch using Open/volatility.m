function sigma=volatility(data,N)
%Function to compute the volatility.
%Compute the log price differences.
%for i=2:N-1
    for i=2:N
if data(i)==0;
            ds(i)=0;
else if data(i-1)==0;
        ds(i)=0;
    else 
    ds(i)=log(abs((data(i)/data(i-1))));
            end
        end
    end
ds(N)=ds(N-1);%Set end point value
%Compute first and second terms.
term1=sqrt(sum(abs(ds.*ds)));
term2=sum(ds)/sqrt(N); %%I think that this should be N-1 according to JMB paper…
%Return the volatility.
sigma=term1-term2;
 