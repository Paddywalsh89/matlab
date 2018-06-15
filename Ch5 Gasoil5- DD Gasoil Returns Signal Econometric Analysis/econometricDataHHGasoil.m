%% 1. Econometric Analysis of HHGasoil returns series r
load('HHGasoilOpen.mat')
HHGasoil_signal='HHGasoil';
HHGasoil_returns_mean=mean(HHGasoilReturns);
HHGasoil_returns_stdDev=std(HHGasoilReturns);
HHGasoil_returns_kurtosis=kurtosis(HHGasoilReturns);
HHGasoil_returns_skew=skewness(HHGasoilReturns);
HHGasoil_returns_min=min(HHGasoilReturns);
HHGasoil_returns_max=max(HHGasoilReturns);
[HHGasoil_returns_jarqueBerraH,p,HHGasoil_returns_jarqueBerra,critval]=jbtest(HHGasoilReturns);
[h,pValue,HHGasoil_returns_LB,cValuee] = lbqtest(HHGasoilReturns,'lags',[5,10,15]);
HHGasoil_annualised_sharpe = sharpe(HHGasoilReturns,2.5); %Where interest free rate (US Treasury 10 yr) on 4th Oct 2010=2.5%
THHGasoil = {HHGasoil_signal,HHGasoil_returns_mean,HHGasoil_returns_stdDev,HHGasoil_returns_kurtosis,HHGasoil_returns_skew,HHGasoil_returns_min,HHGasoil_returns_max,HHGasoil_returns_jarqueBerra,HHGasoil_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 2. Econometric Analysis of HHGasoil returns series r2
HHGasoil_returns2_signal='HHGasoil Squared Returns Series';
HHGasoil_returns2_mean=mean(HHGasoilReturns.^2);
HHGasoil_returns2_stdDev=std(HHGasoilReturns.^2);
HHGasoil_returns2_kurtosis=kurtosis(HHGasoilReturns.^2);
HHGasoil_returns2_skew=skewness(HHGasoilReturns.^2);
HHGasoil_returns2_min=min(HHGasoilReturns.^2);
HHGasoil_returns2_max=max(HHGasoilReturns.^2);
[HHGasoil_returns2_jarqueBerraH,p,HHGasoil_returns2_jarqueBerra,critval]=jbtest(HHGasoilReturns.^2); 
[h,pValue,HHGasoil_returns2_LB,cValue] = lbqtest(HHGasoilReturns.^2,'lags',[5,10,15]);
HHGasoil2_annualised_sharpe = sharpe(HHGasoilReturns.^2,2.5);
T2HHGasoil = {HHGasoil_returns2_signal,HHGasoil_returns2_mean,HHGasoil_returns2_stdDev,HHGasoil_returns2_kurtosis,HHGasoil_returns2_skew,HHGasoil_returns2_min,HHGasoil_returns2_max,HHGasoil_returns2_jarqueBerra,HHGasoil2_annualised_sharpe};
save('econometricDataHHGasoil.mat');