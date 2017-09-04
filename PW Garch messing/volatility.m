% function sigma=volatility(data,N)
% %Function to compute the volatility.
% %Compute the log price differences.
% %for i=2:N-1
%     for i=2:N
%     ds(i)=log(data(i)/data(i-1));
% end
% ds(N)=ds(N-1);%Set end point value
% %Compute first and second terms.
% term1=sqrt(sum(abs(ds.*ds)));
% term2=sum(ds)/sqrt(N); %%I think that this should be N-1 according to JMB paper…
% %Return the volatility.
% sigma=term1-term2;

%%PW Edit, 14-Aug-17
%I altered the above code in order to match the definition of volatility as
%defined in the paper 
%Time Series Analysis for a 1/t? Memory Function and Comparison with the Lyapunov Exponent using Volatility Scaling

function sigma=volatility(data,N)
%Function to compute the volatility.
%Compute the log price differences.
%for i=2:N-1
    for i=2:N
    ds(i)=log(data(i)/data(i-1));
end
ds(N)=ds(N-1);%Set end point value
%Compute first and second terms.
term1=sqrt(sum(abs(ds.*ds)));
%term2=sqrt(sum(ds)/sqrt(N)); %%I think that this should be N-1 according to JMB paper…
%Return the volatility.
sigma=term1-term2;



