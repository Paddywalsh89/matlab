%18-10-16 Going to change chart from Mathematica Aeterna version to show
%volatility. 
%13-11-16 In addition to above I'm going in inclue the S&P 500 index 

%This is a central matlab m-file that will call all other sub m-files
%required for my PhD study. %% 01/03/16 _tester used to test change of MA
%to remove snooping. 20/03/2016 1. Output changed so that Excel tabe is all
%in one line, no moving columns. 2. Brent Crude oil data used instead of
%Gasoil. 3. Instead of 3 sets of weekly, monthly, 6monthly etc., just 1
%test for most recent week, month, 6 month, year. Do the other tess another
%time.

% %03/04/2016 Edited to include 4 years of daily data only
% %%Weekly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**Feb*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
% filename = 'Gasoil';
% sheet1 = 3; 
% alphaRange = 'C3:C943'; %4th Oct 2010  - 01th Oct 2014
% closeRange = 'F3:F943';
% dateRange = 'N3:N943';
% spRange= 'I1008:I3';
% spDateRange= 'J1008:J3';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% date=xlsread(filename, sheet1, dateRange);
% sp=xlsread(filename, sheet1, spRange);
% spDate=xlsread(filename, sheet1, spDateRange);
% formatIn = 'dd-mm-yyyy';
%  matlabdates = datenum('30-Dec-1899',formatIn)+date;
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);

load('GasoilOpen.mat');

%addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Gasoil_Daily_Charts_Volatility_Study')
%% 2. Set the Window, Shift, MA, and Offset
w=20; shift=0.5;offset=6;ma=1;
%clear shift w
excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
excel_row=6;
%for ma=1;%0:1;
    %if ma==1;
    
    %%18-10-16 no need for this loop. 
 %for shift = 0:0.5:0.5;%0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[25];%[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
R8Backtester_Volatility_Garch (spDate, sp, w,shift,gasoil_data,gasoil_data_close,date,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj,mmdate)
 %end
% end
    %else
     %   shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
    %end
   % end
   
   
% %%Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C2163'; %19th Feb - 18th March
% closeRange = 'F2183:F2163';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%6 Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C2055'; %18th March - 18th September
% closeRange = 'F2183:F2055';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%1 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C1926'; %18th March - 20th March
% closeRange = 'F2183:F1926';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%2 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C1672'; %18th Mar - 21st Mar
% closeRange = 'F2183:F1672';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%3 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C1400'; %18th Mar - 22th Mar
% closeRange = 'F2183:F1400';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%4 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C1085'; %18th Mar - 16th Mar
% closeRange = 'F2183:F1085';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% %%5 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C778'; %18th Mar - 18th Mar
% closeRange = 'F2183:F778';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% 
% %%7 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%--0.5-hourly----------------------------------------------------------------
% %**March*********************************************************************
% %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% %Use alternative means of accessing data: 
% addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% filename = 'USOIL1440';
% sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% alphaRange = 'C2183:C448'; %18th Mar - 19th Mar
% closeRange = 'F2183:F448';
% alpha=xlsread(filename, sheet1, alphaRange);
% gasoil_data_close=xlsread(filename, sheet1, closeRange);
% %alpha = flipud(alpha_reverse);
% gasoil_data = alpha;
% %[n]= numel(alpha);
% addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% w=20; shift=0;offset=6;ma=1;
% clear shift w
% excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% %excel_row=6;
% for ma=0:1;
%     if ma==1;
% for shift = 0:0.1:1; 
%     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
%     excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;
% R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
% end
%     else
%    shift = 0; excel_row=excel_row+1;
% for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% excel_row=excel_row+1;  
%     R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% end
%     end
%     end
% 
% 
% 
% % ALL COMMENTED OUT 20/03/16%
% % % %addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1\Weekly\Half hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gaoil_data_close,offset,ma)
% % % %R8Backtester_Volatility (w,shift,gasoil_data,gaoil_data_close)
% % % %addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1\Weekly\Half hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gaoil_data_close,offset,ma)
% % % %**Jun*********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % filename = 'Gasoil';
% % sheet1 = 7; % This is the 0.5hrWeekly Jun tab
% % alphaRange = 'C26027:C26243';
% % closeRange = 'F26027:F26243';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];;%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % 
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\June 2013\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\June 2013\Without shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % %**Oct*********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % filename = 'Gasoil';
% % sheet1 = 7; % This is the 0.5hrWeekly Oct tab
% % alphaRange = 'C21843:C22058';
% % closeRange = 'F21843:F22058';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];;%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Half hourly\Oct 2012\Without shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % 
% % % 
% % % %1-hourly---------------------------------------------------------------------
% % % %**Feb*********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests') %Add R0_results excel path
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly') %Add gasoil data path
% % % filename = 'Gasoil';
% % % sheet1 = 2; % This is the Weekly hourly Feb tab
% % % alpharange = 'C33464:C33674';
% % % alpha=xlsread(filename, sheet1, alpharange);
% % % len=length(alpha); %This a is a loop that extracts every second value in the XLS data group.
% % % ind=0;
% % % for i = 1:2:len
% % %     ind=ind+1;
% % %     alpha_new(ind)=alpha(i);
% % % end
% % % %alpha = flipud(alpha_reverse);
% % % gasoil_data = alpha_new;
% % % %[n]= numel(alpha);
% % % 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Feb 2014\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %**Jun*********************************************************************
% % % clear
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests') %Add R0_results excel path
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly') %Add gasoil data path
% % % filename = 'Gasoil';
% % % sheet1 = 3; % This is the 1hrWeekly hourly Jun tab
% % % alpharange = 'C26027:C26242';
% % % alpha=xlsread(filename, sheet1, alpharange);
% % % len=length(alpha); %This a is a loop that extracts every second value in the XLS data group.
% % % ind=0;
% % % for i = 1:2:len
% % %     ind=ind+1;
% % %     alpha_new(ind)=alpha(i);
% % % end
% % % %alpha = flipud(alpha_reverse);
% % % gasoil_data = alpha_new;
% % % %[n]= numel(alpha);
% % % 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\June 2013\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\June 2013\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %**Oct*********************************************************************
% % % clear
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests') %Add R0_results excel path
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly') %Add gasoil data path
% % % filename = 'Gasoil';
% % % sheet1 = 4; % This is the 1hrWeekly hourly Oct tab
% % % alpharange = 'C21843:C22057';
% % % alpha=xlsread(filename, sheet1, alpharange);
% % % len=length(alpha); %This a is a loop that extracts every second value in the XLS data group.
% % % ind=0;
% % % for i = 1:2:len
% % %     ind=ind+1;
% % %     alpha_new(ind)=alpha(i);
% % % end
% % % %alpha = flipud(alpha_reverse);
% % % gasoil_data = alpha_new;
% % % %[n]= numel(alpha);
% % % 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Weekly\Hourly\Oct 2012\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % %%Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %0.5-hourly----------------------------------------------------------------
% % %Feb***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % filename = 'Gasoil';
% % sheet1 = 5; % This is the 0.5hrMonthly Feb tab
% % alphaRange = 'C33249:C34106';
% % closeRange = 'F33249:F34106';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];;%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Feb 2014\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % %Jun**********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % filename = 'Gasoil';
% % sheet1 = 6; % This is the 0.5hrMonthly Jun tab
% % alphaRange = 'C26500:C26753';
% % closeRange = 'F26500:F26753';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];;%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\June 2013\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\June 2013\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % 
% % %Oct***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % filename = 'Gasoil';
% % sheet1 = 7; % This is the 0.5hrMonthly Oct tab
% % alphaRange = 'C21211:C22183';
% % closeRange = 'F21211:F22183';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Half hourly\Oct 2012\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %1-hourly------------------------------------------------------------------
% % % %Feb
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % % filename = 'Gasoil';
% % % sheet1 = 2; % This is the 1hrMonthly Feb tab
% % % alphaRange = 'C33249:C34105';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Feb 2014\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %Jun***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % % filename = 'Gasoil';
% % % sheet1 = 3; % This is the 1hrMonthly Feb tab
% % % alphaRange = 'C26500:C26752';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\June 2013\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\June 2013\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %Oct***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Monthly')
% % % filename = 'Gasoil';
% % % sheet1 = 4; % This is the 1hrMonthly Feb tab
% % % alphaRange = 'C21212:C22182';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Monthly\Hourly\Oct 2012\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % 
% % % 
% % %%6 Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %0.5-hourly----------------------------------------------------------------
% % %Feb***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % filename = 'Gasoil';
% % sheet1 = 5; % This is the 0.5hr 6Monthly Feb tab
% % alphaRange = 'C28664:C34106';
% % closeRange = 'F28664:F34106';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Feb 2014\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % %Jun***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % filename = 'Gasoil';
% % sheet1 = 6; % This is the 0.5hr 6Monthly Jun tab
% % alphaRange = 'C22059:C26753';
% % closeRange = 'F22059:F26753';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\June 2013\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\June 2013\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % %Oct***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % filename = 'Gasoil';
% % sheet1 = 7; % This is the 0.5hr 6Monthly Jun tab
% % alphaRange = 'C16713:C22183';
% % closeRange = 'F16713:F22183';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Half hourly\Oct 2012\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %1-hourly------------------------------------------------------------------
% % % %Feb***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % % filename = 'Gasoil';
% % % sheet1 = 2; % This is the 1hr6Monthly Feb tab
% % % alphaRange = 'C28664:C34105';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Feb 2014\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Feb 2014\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Feb 2014\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %Jun***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % % filename = 'Gasoil';
% % % sheet1 = 3; % This is the 1hrMonthly Jun tab
% % % alphaRange = 'C22059:C26752';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\June 2013\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\June 2013\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\June 2013\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % %Oct***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\6 Months')
% % % filename = 'Gasoil';
% % % sheet1 = 4; % This is the 1hrMonthly Jun tab
% % % alphaRange = 'C16713:C22182';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Oct 2012\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Oct 2012\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\6 Months\Hourly\Oct 2012\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % 
% % 
% % %1 Yearly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %half hourly
% % %01-Feb-2013 to 01-FEb-2014************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\1 year')
% % filename = 'Gasoil';
% % sheet1 = 9; % This is the 1hr Feb 2014-2013 tab
% % alphaRange = 'C14562:C34106';
% % closeRange = 'F14562:F34106';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\Half hourly\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\Half hourly\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\Half hourly\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % 
% % 
% % % %hourly----------------------------------------------------------------
% % % %Feb 2014-2013***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\1 year')
% % % filename = 'Gasoil';
% % % sheet1 = 2; % This is the 1hr Feb 2014-2013 tab
% % % alphaRange = 'C14562:C34105';
% % % alpha=xlsread(filename, sheet1, alphaRange);
% % % gasoil_data = alpha;
% % % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\With Shift tests')
% % % w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\Without shift with MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\1 Year\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% % 
% % 
% % % % %%4 Yearly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % %Half hourly----------------------------------------------------------------
% % % %1st October 2010- 1st October 2010***********************************************************************
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5') %note- does this need to be called at every iteration? 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\4 year')
% % filename = 'Gasoil';
% % sheet1 = 10; % This is the 1hr Nov 2010-2013 tab
% % alphaRange = 'C1:C40495';
% % closeRange = 'F1:F40495';
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data = alpha;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+2;
% % for w =[2 ];%5 ];%10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % % %[n]= numel(alpha);
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\4 Year\Half hourly\With Shift tests')
% % % w=20; shift=0;offset=offset+2;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\4 Year\Half hourly\Without shift with MA tests')
% % % w=20; shift=0.6;offset=offset+1;ma=1;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % % %addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\4 Year\Half hourly\Without Shift without MA tests')
% % % w=20; shift=0;offset=offset+1;ma=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data,gasoil_data_close,offset,ma)
% % display 'finished' 
% % % % %hourly----------------------------------------------------------------
% % % % %1st Feb 2014- 1st Feb
% % % 2010***********************************************************************
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % % %note- does this need to be called at every iteration?
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil
% % % Half-hourly\4 year') filename = 'Gasoil'; sheet1 = 2; % This is the 1hr
% % % Nov 2010-2013 tab alphaRange = 'C3:C40494'; alpha=xlsread(filename,
% % % sheet1, alphaRange); gasoil_data = alpha; %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further
% % % Study\Thesis\myfiles\Ch5\Tests\4 Year\With Shift tests') w=20; shift=0.6;
% % % R7Backtester (w,shift,gasoil_data)
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further
% % % Study\Thesis\myfiles\Ch5\Tests\4 Year\Without shift with MA tests') w=20;
% % % shift=0; R8Backtester_Volatility (w,shift,gasoil_data)
% % % 
% % % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\4 Year\Without Shift without MA tests')
% % % w=20; shift=0;
% % % R8Backtester_Volatility (w,shift,gasoil_data)
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %%%Repeat for Lyapunov%%%
% 
% 
% 
% 
% 
% 
% 
% 
% % %%Weekly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**Feb*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C2179'; %14th March - 18th March
% % closeRange = 'F2183:F2179';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C2163'; %19th Feb - 18th March
% % closeRange = 'F2183:F2163';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%6 Monthly data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C2055'; %18th March - 18th September
% % closeRange = 'F2183:F2055';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%1 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C1926'; %18th March - 20th March
% % closeRange = 'F2183:F1926';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%2 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C1672'; %18th Mar - 21st Mar
% % closeRange = 'F2183:F1672';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%3 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C1400'; %18th Mar - 22th Mar
% % closeRange = 'F2183:F1400';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%4 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C1085'; %18th Mar - 16th Mar
% % closeRange = 'F2183:F1085';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % %%5 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C778'; %18th Mar - 18th Mar
% % closeRange = 'F2183:F778';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end
% % 
% % %%7 Year data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%--0.5-hourly----------------------------------------------------------------
% % %**March*********************************************************************
% % %path added within m-file addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
% % %Use alternative means of accessing data: 
% % addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Brent Data')
% % filename = 'USOIL1440';
% % sheet1 = 1; % This is the 0.5hrWeekly Feb tab
% % alphaRange = 'C2183:C448'; %18th Mar - 19th Mar
% % closeRange = 'F2183:F448';
% % alpha=xlsread(filename, sheet1, alphaRange);
% % gasoil_data_close=xlsread(filename, sheet1, closeRange);
% % %alpha = flipud(alpha_reverse);
% % gasoil_data = alpha;
% % %[n]= numel(alpha);
% % addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Brent_Daily_Daily')
% % w=20; shift=0;offset=6;ma=1;
% % clear shift w
% % excel_columnc=3;excel_columnd=4;excel_columne=5;excel_columnf=6;excel_columng=7;excel_columnh=8;excel_columni=9;excel_columnj=10;
% % %excel_row=6;
% % for ma=0:1;
% % for shift = 0:0.1:1; 
% %     %%excel_columnc=excel_columnc+9;excel_columnd=excel_columnd+9;excel_columne=excel_columne+9;excel_columnf=excel_columnf+9;excel_columng=excel_columng+9;excel_columnh=excel_columnh+9;excel_columni=excel_columni+9;excel_columnj=excel_columnj+9;
% %     excel_row=excel_row+1;
% % for w =[2 5 10 15 20 25 50 100 200];%10 15 20 25 50 100 200];
% % excel_row=excel_row+1;
% % R8Backtester_Volatility_Lyapunov (w,shift,gasoil_data,gasoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)
% % end
% % end
% % end















display 'finished' 