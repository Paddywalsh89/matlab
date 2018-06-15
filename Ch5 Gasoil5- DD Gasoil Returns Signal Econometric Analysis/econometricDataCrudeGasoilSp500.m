%% 1. Econometric Analysis of Crude S&P500 returns series r
load('s&p500Open.mat');
crudeSp500_signal=('S&P500 - Crude Oil');
crudeSp500_returns_mean=mean(sp500CrudeReturns);
crudeSp500_returns_stdDev=std(sp500CrudeReturns);
crudeSp500_returns_kurtosis=kurtosis(sp500CrudeReturns);
crudeSp500_returns_skew=skewness(sp500CrudeReturns);
crudeSp500_returns_min=min(sp500CrudeReturns);
crudeSp500_returns_max=max(sp500CrudeReturns);
[crudeSp500_returns_jarqueBerraH,p,crudeSp500_returns_jarqueBerra,critval]=jbtest(sp500CrudeReturns);
[h,pValue,crudeSp500_returns_LB,cValue] = lbqtest(sp500CrudeReturns,'lags',[5,10,15]);
crudeSp500_annualised_sharpe = sharpe(sp500CrudeReturns,2.31); %Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
TcrudeSp500 = {crudeSp500_signal,crudeSp500_returns_mean,crudeSp500_returns_stdDev,crudeSp500_returns_kurtosis,crudeSp500_returns_skew,crudeSp500_returns_min,crudeSp500_returns_max,crudeSp500_returns_jarqueBerra,crudeSp500_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 2. Econometric Analysis of Crude returns series r2
crudeSp500_returns2_signal='S&P500 - Crude Squared Returns Series';
crudeSp500_returns2_mean=mean(sp500CrudeReturns.^2);
crudeSp500_returns2_stdDev=std(sp500CrudeReturns.^2);
crudeSp500_returns2_kurtosis=kurtosis(sp500CrudeReturns.^2);
crudeSp500_returns2_skew=skewness(sp500CrudeReturns.^2);
crudeSp500_returns2_min=min(sp500CrudeReturns.^2);
crudeSp500_returns2_max=max(sp500CrudeReturns.^2);
[crudeSp500_returns2_jarqueBerraH,p,crudeSp500_returns2_jaqueBerra,critval]=jbtest(sp500CrudeReturns.^2); 
[h,pValue,crudeSp500_returns2_LB,cValue] = lbqtest(sp500CrudeReturns.^2,'lags',[5,10,15]);
crudeSp5002_annualised_sharpe = sharpe(sp500CrudeReturns.^2,2.31);
T2crudeSp500 = {crudeSp500_returns2_signal,crudeSp500_returns2_mean,crudeSp500_returns2_stdDev,crudeSp500_returns2_kurtosis,crudeSp500_returns2_skew,crudeSp500_returns2_min,crudeSp500_returns2_max,crudeSp500_returns2_jaqueBerra,crudeSp5002_annualised_sharpe};

%% 3. Econometric Analysis of Gasoil S&P500 returns series r
gasoilSp500_signal=('S&P500 - Gasoil');
gasoilSp500_returns_mean=mean(sp500GasoilReturns);
gasoilSp500_returns_stdDev=std(sp500GasoilReturns);
gasoilSp500_returns_kurtosis=kurtosis(sp500GasoilReturns);
gasoilSp500_returns_skew=skewness(sp500GasoilReturns);
gasoilSp500_returns_min=min(sp500GasoilReturns);
gasoilSp500_returns_max=max(sp500GasoilReturns);
[gasoilSp500_returns_jarqueBerraH,p,gasoilSp500_returns_jarqueBerra,critval]=jbtest(sp500GasoilReturns) ;
[h,pValue,gasoilSp500_returns_LB,cValuee] = lbqtest(sp500GasoilReturns,'lags',[5,10,15]);
gasoilSp500_annualised_sharpe=sharpe(sp500GasoilReturns,2.5); %Where interest free rate (US Treasury 10 yr) on 04th Oct 2010=2.5%
TgasoilSp500 = {gasoilSp500_signal,gasoilSp500_returns_mean,gasoilSp500_returns_stdDev,gasoilSp500_returns_kurtosis,gasoilSp500_returns_skew,gasoilSp500_returns_min,gasoilSp500_returns_max,gasoilSp500_returns_jarqueBerra,gasoilSp500_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 4. Econometric Analysis of Gasoil returns series r2
gasoilSp500_returns2_signal='S&P500 - Gasoil Squared Returns Series';
gasoilSp500_returns2_mean=mean(sp500GasoilReturns.^2);
gasoilSp500_returns2_stdDev=std(sp500GasoilReturns.^2);
gasoilSp500_returns2_kurtosis=kurtosis(sp500GasoilReturns.^2);
gasoilSp500_returns2_skew=skewness(sp500GasoilReturns.^2);
gasoilSp500_returns2_min=min(sp500GasoilReturns.^2);
gasoilSp500_returns2_max=max(sp500GasoilReturns.^2);
[gasoilSp500_returns2_jarqueBerraH,p,gasoilSp500_returns2_jaqueBerra,critval]=jbtest(sp500GasoilReturns.^2) ;
[h,pValue,gasoilSp500_returns2_LB,cValue] = lbqtest(sp500GasoilReturns.^2,'lags',[5,10,15]);
gasoilSp5002_annualised_sharpe=sharpe(sp500GasoilReturns.^2,2.5);
T2gasoilSp500 = {gasoilSp500_returns2_signal,gasoilSp500_returns2_mean,gasoilSp500_returns2_stdDev,gasoilSp500_returns2_kurtosis,gasoilSp500_returns2_skew,gasoilSp500_returns2_min,gasoilSp500_returns2_max,gasoilSp500_returns2_jaqueBerra,gasoilSp5002_annualised_sharpe};

%% 5. Econometric Analysis of Gasoil S&PGsci returns series r
gasoilSpGsci_signal=('S&P GSCI - Gasoil');
gasoilSpGsci_returns_mean=mean(sp500GsciGasoilReturns);
gasoilSpGsci_returns_stdDev=std(sp500GsciGasoilReturns);
gasoilSpGsci_returns_kurtosis=kurtosis(sp500GsciGasoilReturns);
gasoilSpGsci_returns_skew=skewness(sp500GsciGasoilReturns);
gasoilSpGsci_returns_min=min(sp500GsciGasoilReturns);
gasoilSpGsci_returns_max=max(sp500GsciGasoilReturns);
[gasoilSpGsci_returns_jarqueBerraH,p,gasoilSpGsci_returns_jarqueBerra,critval]=jbtest(sp500GsciGasoilReturns) ;
[h,pValue,gasoilSpGsci_returns_LB,cValuee] = lbqtest(sp500GsciGasoilReturns,'lags',[5,10,15]);
gasoilSpGsci_annualised_sharpe=sharpe(sp500GsciGasoilReturns,2.5); %Where interest free rate (US Treasury 10 yr) on 04th Oct 2010=2.5%
Tgasoilsp500Gsci = {gasoilSpGsci_signal,gasoilSpGsci_returns_mean,gasoilSpGsci_returns_stdDev,gasoilSpGsci_returns_kurtosis,gasoilSpGsci_returns_skew,gasoilSpGsci_returns_min,gasoilSpGsci_returns_max,gasoilSpGsci_returns_jarqueBerra,gasoilSpGsci_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 6. Econometric Analysis of Gasoil S&PGsci returns series r2
gasoilSpGsci_returns2_signal='S&P GSCI - Gasoil Squared Returns Series';
gasoilSpGsci_returns2_mean=mean(sp500GsciGasoilReturns.^2);
gasoilSpGsci_returns2_stdDev=std(sp500GsciGasoilReturns.^2);
gasoilSpGsci_returns2_kurtosis=kurtosis(sp500GsciGasoilReturns.^2);
gasoilSpGsci_returns2_skew=skewness(sp500GsciGasoilReturns.^2);
gasoilSpGsci_returns2_min=min(sp500GsciGasoilReturns.^2);
gasoilSpGsci_returns2_max=max(sp500GsciGasoilReturns.^2);
[gasoilSpGsci_returns2_jarqueBerraH,p,gasoilSpGsci_returns2_jaqueBerra,critval]=jbtest(sp500GsciGasoilReturns.^2) ;
[h,pValue,gasoilSpGsci_returns2_LB,cValue] = lbqtest(sp500GsciGasoilReturns.^2,'lags',[5,10,15]);
gasoilsp500Gsci2_annualised_sharpe=sharpe(sp500GsciGasoilReturns.^2,2.5);
T2gasoilsp500Gsci = {gasoilSpGsci_returns2_signal,gasoilSpGsci_returns2_mean,gasoilSpGsci_returns2_stdDev,gasoilSpGsci_returns2_kurtosis,gasoilSpGsci_returns2_skew,gasoilSpGsci_returns2_min,gasoilSpGsci_returns2_max,gasoilSpGsci_returns2_jaqueBerra,gasoilsp500Gsci2_annualised_sharpe};
save('econometricDataCrudeGasoilSp500.mat');

%% 7. Econometric Analysis of Crude S&P GSCI returns series r
load('s&p500Open.mat');
crudeSpGsci_signal=('S&P GSCI - Crude Oil');
crudeSpGsci_returns_mean=mean(sp500GsciCrudeReturns);
crudeSpGsci_returns_stdDev=std(sp500GsciCrudeReturns);
crudeSpGsci_returns_kurtosis=kurtosis(sp500GsciCrudeReturns);
crudeSpGsci_returns_skew=skewness(sp500GsciCrudeReturns);
crudeSpGsci_returns_min=min(sp500GsciCrudeReturns);
crudeSpGsci_returns_max=max(sp500GsciCrudeReturns);
[crudeSpGsci_returns_jarqueBerraH,p,crudeSpGsci_returns_jarqueBerra,critval]=jbtest(sp500GsciCrudeReturns);
[h,pValue,crudeSpGsci_returns_LB,cValue] = lbqtest(sp500GsciCrudeReturns,'lags',[5,10,15]);
crudeSpGsci_annualised_sharpe = sharpe(sp500GsciCrudeReturns,2.31); %Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
TcrudeSp500Gsci = {crudeSpGsci_signal,crudeSpGsci_returns_mean,crudeSpGsci_returns_stdDev,crudeSpGsci_returns_kurtosis,crudeSpGsci_returns_skew,crudeSpGsci_returns_min,crudeSpGsci_returns_max,crudeSpGsci_returns_jarqueBerra,crudeSpGsci_annualised_sharpe};
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil4- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
%writetable(T,filename);

%% 8. Econometric Analysis of Crude GSCI returns series r2
crudeSpGsci_returns2_signal='S&P GSCI - Crude Squared Returns Series';
crudeSpGsci_returns2_mean=mean(sp500GsciCrudeReturns.^2);
crudeSpGsci_returns2_stdDev=std(sp500GsciCrudeReturns.^2);
crudeSpGsci_returns2_kurtosis=kurtosis(sp500GsciCrudeReturns.^2);
crudeSpGsci_returns2_skew=skewness(sp500GsciCrudeReturns.^2);
crudeSpGsci_returns2_min=min(sp500GsciCrudeReturns.^2);
crudeSpGsci_returns2_max=max(sp500GsciCrudeReturns.^2);
[crudeSpGsci_returns2_jarqueBerraH,p,crudeSpGsci_returns2_jaqueBerra,critval]=jbtest(sp500GsciCrudeReturns.^2); 
[h,pValue,crudeSpGsci_returns2_LB,cValue] = lbqtest(sp500GsciCrudeReturns.^2,'lags',[5,10,15]);
crudeSp5002_annualised_sharpe = sharpe(sp500GsciCrudeReturns.^2,2.31);
T2crudeSp500Gsci = {crudeSpGsci_returns2_signal,crudeSpGsci_returns2_mean,crudeSpGsci_returns2_stdDev,crudeSpGsci_returns2_kurtosis,crudeSpGsci_returns2_skew,crudeSpGsci_returns2_min,crudeSpGsci_returns2_max,crudeSpGsci_returns2_jaqueBerra,crudeSp5002_annualised_sharpe};
