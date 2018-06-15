 tic 
% Revision Notes 
% 07-Apr-18 re-adding multi shift/w
% 26-Oct-17 Gather Data for Gasoil, Brent, and Apha. 
%% 1. Load Data 
%% Gasoil Data 4th Oct 2010  - 01th Oct 2014
% 1. Import the Gasoil Open Data and save to GasoilOpen.mat
%dataGasoilOpen; dataHHGasoilOpen;
% 2. Load data from .MAT file
load('GasoilOpen.mat','dataHHGasoilOpen.mat');
%% Crude Data March 2012-2016
% 1. Import the Crude Open Data and save to CrudeOpen.mat
%dataCrudeOpen;
% 2. Load data from .MAT file
load('CrudeOpen.mat');
%% S&P500 Data for both Crude and Gasoi  
% 1. Import the S&P500 Open Data and save to s&pOpen.mat
%dataSpOpen;
% 2. Load data from .MAT file
load('s&p500Open.mat');
%% 2. Load Econometric Analysis of the Crude, Gasoil, and S&P500 Returns Series 
%PW note, need to run dataSpOpen in order for price signal changes to be
%incorporated. 
run('econometricDataCrude.m');
load('econometricDataCrude.mat');
% 2.1 Load Econometric Analysis of the Gasoil Returns Series 
run('econometricDataGasoil.m');
run('econometricDataHHGasoil.m');
load('econometricDataGasoil.mat','econometricDataHHGasoil.mat');
% 2.2 Load Econometric Analysis of the S&P500 Returns Series for both Crude and Gasoil 
run('econometricDataCrudeGasoilSp500.m');
load('econometricDataCrudeGasoilSp500.mat');
%2.3 Write the output to Excel 
% See Section 7.

%% 3. Autocorrelation of returns innovations - ACF, PACF, Ljung-Box test 
% % ACF
% figure2 = figure;
% subplot3 = subplot(2,1,1,'Parent',figure2);
% hold(subplot3,'on');
% autocorr(gasoilReturns); % input to ACF are just returns, and not innovations after simple linear regression of returns
% title('Gasoil: Autocorrelation of Returns Series');
% % ACF
% subplot4 = subplot(2,1,2,'Parent',figure2);
% hold(subplot4,'on');
% autocorr(gasoilReturns.^2); % input to ACF are just returns2, and not innovations after simple linear regression of returns
% title('Gasoil: Autocorrelation of Squared Returns Series');
% hold off; 

addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Gasoil_Daily_Charts_Volatility_Study')
%% 4. Obtain the Alpha Signal for Alpha DD Gasoil 
%Set the Window, Shift, MA, and Offset, where Offset is used in older Excel. 
clear signalName w shift offset ma sp500index sp500Date date mmdate data returnsSignal interestFreeRate interestFreeRateDaily;
signalName='TradingPerfDDGasoil';w=20; shift=0;offset=6;ma=1;  sp500Index=transpose(sp500Gasoil); spGsciIndex=transpose(sp500GsciGasoil);
sp500Date=sp500DateGasoil;      date=gasoil_date;   mmdate=DDGasoil_mmdate;    data=transpose(gasoil_data);
returnsSignal=gasoilReturns;
%interestFreeRate=2.31   % Crude  Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
interestFreeRate=2.5;    % Gasoil Where interest free rate (US Treasury 10 yr) on 4th Oct 2010=2.5%
interestFreeRateDaily=0; % Approx for daily interest free rate 
excel_row=2; excelSheet=1;

    R15Backtester_Volatility_Econometrics (signalName, sp500Date, sp500Index,spGsciIndex,w,shift,data,gasoil_data_close,date,offset,ma,mmdate,returnsSignal,interestFreeRate,interestFreeRateDaily,excel_row,excelSheet)


%% 5. Obtain the Alpha Signal for Alpha DD Crude 
%Set the Window, Shift, MA, and Offset, where Offset is used in older Excel. 
clear signalName w shift offset ma sp500index sp500Date date mmdate data returnsSignal interestFreeRate interestFreeRateDaily;
w=20; shift=0;offset=6;ma=1;  sp500Index=transpose(sp500Crude); spGsciIndex=transpose(sp500GsciCrude);
signalName='TradingPerfDDCrude'; sp500Date=sp500DateCrude;      date=crude_date;   mmdate=DDCrude_mmdate;    data=transpose(crude_data);
returnsSignal=crudeReturns;
interestFreeRate=2.31;   % Crude  Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
interestFreeRateDaily=0; % Approx for daily interest free rate 
excel_row=2; excelSheet=2;

    R15Backtester_Volatility_Econometrics (signalName, sp500Date, sp500Index,spGsciIndex,w,shift,data,gasoil_data_close,date,offset,ma,mmdate,returnsSignal,interestFreeRate,interestFreeRateDaily,excel_row,excelSheet)


toc
%% 6. Obtain the Alpha Signal for Alpha HHGasoil Crude 
% % Set the Window, Shift, MA, and Offset, where Offset is used in older Excel. 
% clear signalName w shift offset ma sp500index sp500Date date mmdate data returnsSignal interestFreeRate interestFreeRateDaily;
% signalName='TradingPerfHHGasoil'; w=20; shift=0.5;offset=6;ma=1;  sp500Index=transpose(0); spGsciIndex=transpose(0);
% sp500Date=0;      date=HHGasoil_date;   mmdate=HHGasoil_mmdate;    data=transpose(HHGasoil_data);
% returnsSignal=HHGasoilReturns;
% interestFreeRate=2.31;   % Crude  Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
% interestFreeRateDaily=0; % Approx for daily interest free rate 
% R10Backtester_Volatility_Econometrics (signalName,w,shift,data,gasoil_data_close,date,offset,ma,mmdate,returnsSignal,interestFreeRate,interestFreeRateDaily)
% toc
%% 7. Write to Excel 
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil5- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
econometricHeadings={'Returns Signal','Mean (%)','Std. Dev','Kurtosis','Skew','Min Value (%)','Max Value (%)','Jarque Berra H','Annualised Sharpe'};
Tglobal=[econometricHeadings; Tcrude; T2crude; Tgasoil; T2gasoil; TcrudeSp500; T2crudeSp500; TgasoilSp500; T2gasoilSp500; THHGasoil; T2HHGasoil; Tgasoilsp500Gsci; T2gasoilsp500Gsci;TcrudeSp500Gsci;T2crudeSp500Gsci;]; 
xlswrite(filename,Tglobal,1,'A1') % T2crude,Tgasoil, T2gasoil,TcrudeSp500, T2crudeSp500, TgasoilSp500, T2gasoilSp500,filename);
toc

%Write Trading Perf to excel
run('tradingData.m');
load('tradingData.mat');
filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\phdRepo\matlab\Ch5 Gasoil5- DD Gasoil Returns Signal Econometric Analysis\econometricTables.xlsx';
Headings={'Signal','No. of Trades','Winning (%)','Total PnL ($)','ROI (%)','Annualised Sharpe'};
TperfAnalysis=[Headings; tradingPerfHHGasoil;tradingPerfDDGasoil;tradingPerfDDCrude;tradingPerfDDGasoilSp;tradingPerfDDCrudeSp;tradingPerfDDGasoilSpGsci;tradingPerfDDCrudeSpGsci]; 
xlswrite(filename,TperfAnalysis,2,'A1');
tradingPerfOrderDetailsDDCrude
tradingPerfOrderDetailsDDCrude
toc
%% 8. Draw plots for Paper: Trading Signal Analysis 
% run('plotsForPaper.m');
