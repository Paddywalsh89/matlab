%%PW 29-07-2017
%%Messing with GARCH 

%%1. Add Dail Gasoil Data from 2010 to 2014 
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
filename = 'Gasoil';
sheet1 = 3; 
openRange = 'C3:C943'; %4th Oct 2010  - 01th Oct 2014
open=xlsread(filename, sheet1, openRange);
dateRange = 'N3:N943';
date=xlsread(filename, sheet1, dateRange);

y = open;
%r = price2ret(y);
T = length(y);

for i = 2:1:T;
    returnsasrow(i)=y(i)-y(i-1);
end
returns=transpose(returnsasrow);

figure
subplot(2,2,1)
plot(y)
xlim([0,T])
title('Gasoil Open Price Oct 2010-2014')

subplot(2,2,2)
%hold on
plot(returns)
grid on
xlim([0,T])
title('Gasoil Open Price Oct 2010-2014')

%%2. Fit an eGarch Model, a Garch (1,1) model and a GRJ model) 
%where - EstParamCov=Variance-covariance matrix of maximum likelihood estimates of model parameters known to the optimizer, returned as a numeric matrix.
%and - logL= Optimized loglikelihood objective function value, returned as a scalar. https://uk.mathworks.com/help/econ/cvm.estimate.html

Mdl1 = egarch(1,1);
Mdl2=garch(1,1);
Mdl3=gjr(1,1); 

[EstMdl1,EstParamCov1,logL(1)]  = estimate(Mdl1,returns);
[EstMdl2,EstParamCov2,logL(2)] = estimate(Mdl2,returns);
[EstMdl3,EstParamCov3,logL(3)] = estimate(Mdl3,returns);

numParams(1) = sum(any(EstParamCov1));
numParams(2) = sum(any(EstParamCov2));
numParams(3) = sum(any(EstParamCov3));

%2.5 Compare the models using AIC & BIC:
[aic,bic] = aicbic(logL,numParams,T)

%%3. Infer the conditional variance (don't know what this means) 
v = infer(EstMdl,returns);

figure
plot(v)
xlim([0,T])
title('Inferred Conditional Variances')

%%4. Compute the residuals 
%%Subtract the estimated mean offset, and divide by the square root of the conditional variance process.

res = (returns-EstMdl2.Offset)./sqrt(v);

figure
subplot(2,2,1)
plot(res)
xlim([0,T])
title('Standardized Residuals')

subplot(2,2,2)
hist(res,10)

subplot(2,2,3)
autocorr(res)

subplot(2,2,4)
parcorr(res)

%5. Estimate an 


