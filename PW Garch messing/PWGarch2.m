%%THe purpose of this mFile is to re-use my Ch.5 code to recalculate the
%%volatility of daily Gasoil. Code take verbatum from: 
%/Users/paddywalsh/Dropbox (Personal)/Further Study/Thesis/myfiles/AppendixB/Chapter 5 - Experiment 1 - Optimisation_Gasoil_Daily_Charts_Volatility_Study
%Master_M_Recent_Gasoil_Volatility.m
%and R8Backtester_Volatility.m

%%TEst comment for GIT
%%Test2

%%PART 1: Code take from PW Garch 1 so that I can compare volatility of
%%Garch with Stoch Volatility by passing Garch vol into R8 Backtester 

%%1. Add Dail Gasoil Data from 2010 to 2014 
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
filename = 'Gasoil';
sheet1 = 3; 
openRange = 'C3:C943'; %4th Oct 2010  - 01th Oct 2014
open=xlsread(filename, sheet1, openRange);
dateRange = 'N3:N943';
date=xlsread(filename, sheet1, dateRange);
date = x2mdate(date, 1,'datetime');


%%2. Take Log of open price for 1st graph and price returns for 2nd graph. 
%y = log(open);
y = open;
%%r = price2ret(open); %%Removing this as MMMQuant uses a different
%%formula.
r = double((log(y(2:end)./y(1:end-1)))*100); % scaled returns in [%] for numerical stability
e = r - mean(r); % innovations after simple linear regression of returns
y = y(2:end);
date = date(2:end);

T = length(y);

%for i = 2:1:T;
   % returnsasrow(i)=y(i)-y(i-1);
%end
r=transpose(r);

%% Plot C and r
 
% C
 
figure1 = figure;
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
plot(date,y,'Parent',subplot1);
ylabel('Gasoil Open Price Oct 2010-2014');
box(subplot1,'on');
set(subplot1,'FontSize',16,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');

% figure
% subplot(2,1,1)
% plot(y,'r')
% xlim([0,T])
% title('Gasoil Open Price Oct 2010-2014')

subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');
plot(date,r,'Parent',subplot2);
ylabel('returns [%]');
box(subplot2,'on');
set(subplot2,'FontSize',16,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% 
% subplot(2,1,2)
% %figure
% hold on
% plot(returns,'r')
% plot(r)
% grid on
% xlim([0,T])
% title('Gasoil Open Price Oct 2010-2014')

%% Autocorrelation of returns innovations - ACF, PACF, Ljung-Box test
 
% ACF
 
figure2 = figure;
subplot3 = subplot(2,1,1,'Parent',figure2);
hold(subplot3,'on');
autocorr(e); % input to ACF are innovations after simple linear regression of returns
% PACF
 
subplot4 = subplot(2,1,2,'Parent',figure2);
hold(subplot4,'on');
parcorr(e); % input to ACF are innovations after simple linear regression of returns
% Ljung-Box test
 
[hLB,pLB] = lbqtest(e,'Lags',3);




%%2. Fit an eGarch Model, a Garch (1,1) model and a GRJ model) 
%where - EstParamCov=Variance-covariance matrix of maximum likelihood estimates of model parameters known to the optimizer, returned as a numeric matrix.
%and - logL= Optimized loglikelihood objective function value, returned as a scalar. https://uk.mathworks.com/help/econ/cvm.estimate.html

Mdl1 = egarch(1,1);
Mdl2=garch(1,1);
Mdl3=gjr(1,1); 

[EstMdl1,EstParamCov1,logL(1)]  = estimate(Mdl1,returns);
[EstMdl2,EstParamCov2,logL(2)] = estimate(Mdl2,returns);
[EstMdl3,EstParamCov3,logL(3)] = estimate(Mdl3,returns);

numParams(1) = sum(any(EstParamCov1));
numParams(2) = sum(any(EstParamCov2));
numParams(3) = sum(any(EstParamCov3));

%2.5 Compare the models using AIC & BIC:
[aic,bic] = aicbic(logL,numParams,T)

%%3. Infer the conditional variance (don't know what this means) 
var = infer(EstMdl2,returns);
vol=sqrt(var);

figure(5);
plot(vol)
xlim([0,T])
title('Inferred Conditional Variances')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%Part 2: Code taken verbatum from Master_M_Recent_Gasoil_Volatility.m

addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Gasoil Data\Gasoil_Daily')
filename = 'Gasoil';
sheet1 = 3; 
alphaRange = 'C3:C943'; %4th Oct 2010  - 01th Oct 2014
closeRange = 'F3:F943';
dateRange = 'N3:N943';
spRange= 'I1008:I3';
spDateRange= 'J1008:J3';
alpha=xlsread(filename, sheet1, alphaRange);
gasoil_data_close=xlsread(filename, sheet1, closeRange);
date=xlsread(filename, sheet1, dateRange);
sp=xlsread(filename, sheet1, spRange);
spDate=xlsread(filename, sheet1, spDateRange);
formatIn = 'dd-mm-yyyy';
 matlabdates = datenum('30-Dec-1899',formatIn)+date;
%alpha = flipud(alpha_reverse);
gasoil_data = alpha;
%[n]= numel(alpha);

addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Work\Matlab\Garch messing\PW Garch messing\R8Backtester_Volatility.m')
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
R8Backtester_Volatility (spDate, sp, w,shift,gasoil_data,gasoil_data_close,date,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj,vol)
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
 
display 'finished' 