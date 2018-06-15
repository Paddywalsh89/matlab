%% 1. Econometric Analysis of Crude returns series r
load('crudeOpen.mat')
signal=('Crude Oil');
crude_returns_mean=mean(crudeReturns);
crude_returns_stdDev=std(crudeReturns);
crude_returns_kurtosis=kurtosis(crudeReturns);
crude_returns_skew=skewness(crudeReturns);
crude_returns_min=min(crudeReturns);
crude_returns_max=max(crudeReturns);
[crude_returns_jarqueBerraH,p,crude_returns_jarqueBerra,critval]=jbtest(crudeReturns);
[h,pValue,crude_returns_LB,cValue] = lbqtest(crudeReturns,'lags',[5,10,15]);
crude_annualised_sharpe = sharpe(crudeReturns,2.31); %Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
Tcrude = {signal,crude_returns_mean,crude_returns_stdDev,crude_returns_kurtosis,crude_returns_skew,crude_returns_min,crude_returns_max,crude_returns_jarqueBerra,crude_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 2. Econometric Analysis of Crude returns series r2
signal='Crude Squared Returns Series';
crude_returns2_mean=mean(crudeReturns.^2);
crude_returns2_stdDev=std(crudeReturns.^2);
crude_returns2_kurtosis=kurtosis(crudeReturns.^2);
crude_returns2_skew=skewness(crudeReturns.^2);
crude_returns2_min=min(crudeReturns.^2);
crude_returns2_max=max(crudeReturns.^2);
[crude_returns2_jarqueBerraH,p,crude_returns2_jarqueBerra,critval]=jbtest(crudeReturns.^2); 
[h,pValue,crude_returns2_LB,cValue] = lbqtest(crudeReturns.^2,'lags',[5,10,15]);
crude2_annualised_sharpe = sharpe(crudeReturns.^2,2.31);
T2crude = {signal,crude_returns2_mean,crude_returns2_stdDev,crude_returns2_kurtosis,crude_returns2_skew,crude_returns2_min,crude_returns2_max,crude_returns2_jarqueBerra, crude2_annualised_sharpe};
save('econometricDataCrude.mat');