clear crudeOpen.mat
%% 1. Add Daily Crude Data from March 2012 to March 2016
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
filenameCrude = 'USOIL1440';
sheet1Crude = 1; % This is the 0.5hrWeekly Feb tab
alphaRangeCrude = 'C2183:C1085'; %16th Mar 2012 - 18th Mar 2016
closeRangCrude = 'G2183:G1085';
dateRangeCrude = 'N2183:N1085';
alphaCrude=xlsread(filenameCrude, sheet1Crude, alphaRangeCrude);
crudeReturns = double((log(alphaCrude(2:end)./alphaCrude(1:end-1)))*100);
crude_data_close=xlsread(filenameCrude, sheet1Crude, closeRangCrude);
crude_date=xlsread(filenameCrude, sheet1Crude, dateRangeCrude);
formatIn = 'dd-mm-yyyy';
crude_matlabdates = datenum('30-Dec-1899',formatIn)+crude_date;
DDCrude_mmdate = x2mdate(crude_date, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 
%alpha = flipud(alpha_reverse);
crude_data = alphaCrude;
DDCrudeSignal_Norm=(crude_data - min(crude_data))/(max(crude_data)-min(crude_data));

%%2. Save data from Excel spreadsheet to local .mat file (quicker) 
save('crudeOpen');

%3. Load data from .MAT file
%load('GasoilOpen.mat');
