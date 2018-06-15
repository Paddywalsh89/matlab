%% 1. Econometric Analysis of Gasoil returns series r
load('GasoilOpen.mat')
Gasoil_signal='Gasoil';
Gasoil_returns_mean=mean(gasoilReturns);
Gasoil_returns_stdDev=std(gasoilReturns);
Gasoil_returns_kurtosis=kurtosis(gasoilReturns);
Gasoil_returns_skew=skewness(gasoilReturns);
Gasoil_returns_min=min(gasoilReturns);
Gasoil_returns_max=max(gasoilReturns);
[Gasoil_returns_jarqueBerraH,p,Gasoil_returns_jarqueBerra,critval]=jbtest(gasoilReturns);
[h,pValue,Gasoil_returns_LB,cValuee] = lbqtest(gasoilReturns,'lags',[5,10,15]);
Gasoil_annualised_sharpe = sharpe(gasoilReturns,2.5); %Where interest free rate (US Treasury 10 yr) on 4th Oct 2010=2.5%
Tgasoil = {Gasoil_signal,Gasoil_returns_mean,Gasoil_returns_stdDev,Gasoil_returns_kurtosis,Gasoil_returns_skew,Gasoil_returns_min,Gasoil_returns_max,Gasoil_returns_jarqueBerra,Gasoil_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 2. Econometric Analysis of Gasoil returns series r2
Gasoil_returns2_signal='Gasoil Squared Returns Series';
Gasoil_returns2_mean=mean(gasoilReturns.^2);
Gasoil_returns2_stdDev=std(gasoilReturns.^2);
Gasoil_returns2_kurtosis=kurtosis(gasoilReturns.^2);
Gasoil_returns2_skew=skewness(gasoilReturns.^2);
Gasoil_returns2_min=min(gasoilReturns.^2);
Gasoil_returns2_max=max(gasoilReturns.^2);
[Gasoil_returns2_jarqueBerraH,p,Gasoil_returns2_jarqueBerra,critval]=jbtest(gasoilReturns.^2); 
[h,pValue,Gasoil_returns2_LB,cValue] = lbqtest(gasoilReturns.^2,'lags',[5,10,15]);
Gasoil2_annualised_sharpe = sharpe(gasoilReturns.^2,2.5);
T2gasoil = {Gasoil_returns2_signal,Gasoil_returns2_mean,Gasoil_returns2_stdDev,Gasoil_returns2_kurtosis,Gasoil_returns2_skew,Gasoil_returns2_min,Gasoil_returns2_max,Gasoil_returns2_jarqueBerra,Gasoil2_annualised_sharpe};
save('econometricDataGasoil.mat');