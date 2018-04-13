 clear 'GasoilOpen.mat';

%% 1. Add Dail Gasoil Data from 2010 to 2014 
addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
filename = 'Gasoil';
sheet1 = 3; 
alphaRangeGasoil = 'C3:C1040'; %Monday 4th Oct 2010  - Wednesday 01st Oct 2014
closeRangeGasoil = 'F3:F1040';
dateRangeGasoil = 'N3:N1040';
alphaGasoil=xlsread(filename, sheet1, alphaRangeGasoil);
gasoilReturns = double((log(alphaGasoil(2:end)./alphaGasoil(1:end-1)))*100);
gasoil_data_close=xlsread(filename, sheet1, closeRangeGasoil);
gasoil_date=xlsread(filename, sheet1, dateRangeGasoil);
formatIn = 'dd-mm-yyyy';
gasoil_matlabdates = datenum('30-Dec-1899',formatIn)+gasoil_date;
DDGasoil_mmdate = x2mdate(gasoil_date, 0,'datetime'); %for convention 0, starts at 1900. Convention 1 starts at 1904. 
%alpha = flipud(alpha_reverse);
gasoil_data = alphaGasoil;
DDGasoilSignal_Norm=(gasoil_data - min(gasoil_data))/(max(gasoil_data)-min(gasoil_data));

%[n]= numel(alpha);


%% 2. Save data from Excel spreadsheet to local .mat file (quicker) 
save('GasoilOpen');

%3. Load data from .MAT file
%load('GasoilOpen.mat');