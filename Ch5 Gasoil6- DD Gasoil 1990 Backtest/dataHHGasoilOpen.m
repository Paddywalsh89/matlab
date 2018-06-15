clear 'HHGasoilOpen.mat';
%% 1. Add HH Gasoil Data from  
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\4 year')
filenameHHGasoil = 'HHGasoil';
sheet1HHGasoil = 10; 
alphaRangeHHGasoil = 'C1:C40495'; %01Oct2010 - 01Oct2014
closeRangeHHGasoil = 'F1:F40495';
dateRangeHHGasoil = 'K1:K40495';
sp500RangeHHGasoil= ''; %S&P500 index value
sp500dateRangeHHGasoil= '';
alphaHHGasoil=xlsread(filenameHHGasoil, sheet1HHGasoil, alphaRangeHHGasoil);
HHGasoilReturns = double((log(alphaHHGasoil(2:end)./alphaHHGasoil(1:end-1)))*100);
HHGasoil_data_close=xlsread(filenameHHGasoil, sheet1HHGasoil, closeRangeHHGasoil);
HHGasoil_date=xlsread(filenameHHGasoil, sheet1HHGasoil, dateRangeHHGasoil);
formatIn = 'dd-mm-yyyy';
HHGasoil_matlabdates = datenum('30-Dec-1899',formatIn)+HHGasoil_date;
HHGasoil_mmdate = x2mdate(HHGasoil_date, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 
%alpha = flipud(alpha_reverse);
HHGasoil_data = alphaHHGasoil;
HHGasoilSignal_Norm=(HHGasoil_data - min(HHGasoil_data))/(max(HHGasoil_data)-min(HHGasoil_data));
%[n]= numel(alpha);


%% 2. Save data from Excel spreadsheet to local .mat file (quicker) 
save('HHGasoilOpen');

%3. Load data from .MAT file
%load('HHGasoilOpen.mat');