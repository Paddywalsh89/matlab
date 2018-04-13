clear 's&p500Open.mat';
%% 1. Add S&P500 Data from March 2012 to March 2016
%This S&P500 matches the CrudeOil timeframe
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
filenameCrude = 'USOIL1440.xlsx';
sheet1Crude = 1; % This is the 0.5hrWeekly Feb tab
sp500RangeCrude= 'R1917:R910'; % %16th Mar 2012 - 18th Mar 2016
sp500DateRangeCrude= 'q1917:q910';
sp500Crude=xlsread(filenameCrude, sheet1Crude, sp500RangeCrude);
sp500Crude_Norm=(sp500Crude - min(sp500Crude))/(max(sp500Crude)-min(sp500Crude));
sp500CrudeReturns=double((log(sp500Crude(2:end)./sp500Crude(1:end-1)))*100);
sp500DateCrude=xlsread(filenameCrude, sheet1Crude, sp500DateRangeCrude);
formatIn = 'dd-mm-yyyy';
matlabdatesCrude = datenum('30-Dec-1899',formatIn)+sp500DateCrude;
mmdateCrude = x2mdate(sp500DateCrude, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 

%% 2.Add S&P500 Data from 4th Oct 2010  - 01th Oct 2014
%This S&P500 matches the Gasoil timeframe
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
filenameGasoil = 'Gasoil';
sheet1Gasoil = 3; 
dateRange = 'p3:p1008'; %Gasoil: Monday 4th Oct 2010  - Wednesday 01th Oct 2014
sp500RangeGasoil= 'I1008:I3';%Sp500: Monday 4th Oct 2010  - Wednesday 01th Oct 2014
sp500DateRangeGasoil= 'p1008:p3'; %NOTE - there are more data points for Sp500, hence 943,1008.
sp500Gasoil=xlsread(filenameGasoil, sheet1Gasoil, sp500RangeGasoil);
sp500Gasoil_Norm=(sp500Gasoil - min(sp500Gasoil))/(max(sp500Gasoil)-min(sp500Gasoil));
sp500GasoilReturns=double((log(sp500Gasoil(2:end)./sp500Gasoil(1:end-1)))*100);
sp500DateGasoil=xlsread(filenameGasoil, sheet1Gasoil, sp500DateRangeGasoil);
formatIn = 'dd-mm-yyyy';
matlabdatesGasoil = datenum('30-Dec-1899',formatIn)+sp500DateGasoil;
mmdateGasoil = x2mdate(sp500DateGasoil, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 


%% 3. Add S&P GSCI Data from March 2012 to March 2016
%This S&P500 GSCI matches the CrudeOil timeframe
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\S&P GSCI')
filenameGsciCrude = 'S&P GSCI.xlsx';
sheet1GsciCrude = 1; % This is the 0.5hrWeekly Feb tab
sp500RangeGsciCrude= 'D561:D1570'; % %16th Mar 2012 - 18th Mar 2016
sp500DateRangeGsciCrude= 'i561:i1570';
sp500GsciCrude=xlsread(filenameGsciCrude, sheet1GsciCrude, sp500RangeGsciCrude);
sp500GsciCrude_Norm=(sp500GsciCrude - min(sp500GsciCrude))/(max(sp500GsciCrude)-min(sp500GsciCrude));
sp500GsciCrudeReturns=double((log(sp500GsciCrude(2:end)./sp500GsciCrude(1:end-1)))*100);
sp500DateGsciCrude=xlsread(filenameGsciCrude, sheet1GsciCrude, sp500DateRangeGsciCrude);
formatIn = 'dd-mm-yyyy';
matlabdatesGsciCrude = datenum('30-Dec-1899',formatIn)+sp500DateGsciCrude;
mmdateGsciCrude = x2mdate(sp500DateGsciCrude, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 

%% 4.Add S&P GSCI Data from 4th Oct 2010  - 01th Oct 2014
%This S&P500 matches the Gasoil timeframe
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\S&P GSCI')
filenameGsciGasoil = 'S&P GSCI';
sheet1GsciGasoil = 1; 
%Gasoil: Monday 4th Oct 2010  - Wednesday 01th Oct 2014
sp500RangeGsciGasoil= 'D195:D1202';%Sp500: Monday 4th Oct 2010  - Wednesday 01th Oct 2014
sp500DateRangeGsciGasoil= 'i195:i1202'; %NOTE - there are more data points for Sp500, hence 943,1008.
sp500GsciGasoil=xlsread(filenameGsciGasoil, sheet1GsciGasoil, sp500RangeGsciGasoil);
sp500GsciGasoil_Norm=(sp500GsciGasoil - min(sp500GsciGasoil))/(max(sp500GsciGasoil)-min(sp500GsciGasoil));
sp500GsciGasoilReturns=double((log(sp500GsciGasoil(2:end)./sp500GsciGasoil(1:end-1)))*100);
sp500DateGsciGasoil=xlsread(filenameGsciGasoil, sheet1GsciGasoil, sp500DateRangeGsciGasoil);
formatIn = 'dd-mm-yyyy';
matlabdatesGsciGasoil = datenum('30-Dec-1899',formatIn)+sp500DateGsciGasoil;
mmdateGsciGasoil = x2mdate(sp500DateGsciGasoil, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 


%% 5. Save data from Excel spreadsheet to local .mat file (quicker) 
save('s&p500Open.mat');

%3. Load data from .MAT file
%load('GasoilOpen.mat');