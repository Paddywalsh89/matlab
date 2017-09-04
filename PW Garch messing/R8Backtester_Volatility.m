%%12-Aug-17 
%%This is a list of changes made to this version (PW Garch Messing) as
%%opposed to the version in %/Users/paddywalsh/Dropbox (Personal)/Further Study/Thesis/myfiles/AppendixB/Chapter 5 - Experiment 1 - Optimisation_Gasoil_Daily_Charts_Volatility_Study
%%1. Line 96 - moving average of Sigma removed. 

%function R8Backtester_Volatility(spDate,sp,w,shift,gasoil_data,gasoil_data_close,date,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)%gasoil_data_close,excel_row,date,time,indicator
function R8Backtester_Volatility (spDate, sp, w,shift,gasoil_data,gasoil_data_close,date,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj,vol)
%w=20;
%shift=0;
%Back-testing procedure for Levy_Index/volatility indicator performance
%This backtester is used as a test on a week's worth of Gasoil half hourly
%data. 

%NB - Mov av deleted from this m-file
%Buy/Sell at zero crossing

%NOTE: R1:Try calling data as per JMB
% %R2: Nromalised the data differently
%R3: Add profitibality measure, investigate v1 and v2. 
%R4: Move normalising of zero crossing price data until very last point. 
%R5: Change table output from latex form to excel form. 
%R6: Changing data used for Gasoil price signal from default to R9_Excel
     %spreadsheet - converted to notepad for ease of programming. Maybe the
     %difference was in normalising the singal...
%R7: +w changed in line 79. I don't know why this needed to be here - why
%would you skip first w terms, if these are used in calculating gamma. 
%R8 - buy/sell at zero-crossing

%I want to run this without the shift too! 

%INPUT PARAMETERS
%w - size of moving window: Default w=20
%shift - shift of moving average filter 0<shift<1: Default shift=0.5 
%shift=0 gives fully dynamic trading
%shift=1 give fully static trading strategy
% 
%Set length of look-back window for (moving avarege) filtering of 
%Levy Index and Stochastic Volatility to
datarange={'Half hourly Gasoil data, Monday 10-Feb-2014 to Friday 14-Feb-2014'};
ww=w;
%Set status of variance of Levy index to:
varstatus=0; %variance=1 is on, variance=0 is off;
event_number=[0]; %This is a variable created to keep track of the buy/sell open/close events and number them.
%Read file from txt file into data array.
%fid=fopen('C:\JMB\NDRC\Energia\Backtester\BrentCrudeD.txt','r');clc

%fid=fopen('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Tests\Half hourly\Feb 2014\With Shift tests\Gasoil_Weekly_halfhour.txt','r');
%R5 - fid=fopen('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5\Gasoil_Weekly_halfhour.txt','r');
%Preious - fid=fopen('C:\Users\Walsh_pad\Dropbox\Further Study\Work\Matlab\Backtester\Software-PW\GasoilW_R1.txt','r');
%[data n]=fscanf(fid,'%g',[inf]);
%fclose(fid);
%Use alternative means of accessing data: 
%addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Gasoil Data\Gasoil Half-hourly\Weekly')
%filename = 'Gasoil';
%sheet1 = 1; % This is the Weekly Feb tab
%alphaRange = 'C33464:C33674';

%alpha=xlsread(filename, sheet1, alphaRange);
%alpha = flipud(alpha_reverse);
%[data] = alpha;
%[n]= numel(alpha);
[gasoil_data]=gasoil_data;
[gasoil_data_close]=gasoil_data_close;
data=gasoil_data;
[n]= numel(gasoil_data);
%[time]=datenum(time,'HH:MM');
%[date]=date;
%Begin moving window process 
%for k=100:1:n 
%m=k-w;
m=n-w;
for i=1:m %PW from m to n to include ALL data points not just most recent m
%for i=1:m %Matlab completes this iteration first. I.e. data(1+1,1+2,..1+j), then data((i+1)+1,(i+1)+2,+...(i+1)+j)
%Window the data. 
for j=1:w
   
s(j)=data(i+j);
end
%Compute the Levy Index 
[s]=s;
gamma(i)=Levyindex(s,w);
gamma_no_MA(i)=Levyindex(s,w);
%Compute the Stochastic Volatilty (optional)
sigma(i)=volatility(s,w);
v(i)=varstatus*variance(s,w);
% t(i) = time(i);
% d(i) = date(i);
 
%End the moving window process.
end
%PW - Feb 15 Remove the Filter...Levy index and volatility using a moving avarege filter
try
if ma == 1;
gamma=movav_R1(gamma,m,ww,shift);

%%sigma=movav(sigma,m,ww,shift);


else
    gamma=gamma;
    sigma=sigma;
end

catch end



%gamma=conv(gamma,filter,'same');%Filter with function MATLAB function conv.
%sigma=conv(sigma,filter,'same');
%Prepare the original signal and Levy index LI (divided by volatility - optional).
i=1;%Initialise value of counter.
for j=1:m %PW m changed to n for ALL data points
%for j=1:m
    signal(i)=data(j+w); %PW removed 01/03/15 +w);%Read data in window into signal array.
   %LI(i)= gamma(j)*100/sigma(j); %LI = Levy Index in given window
     LI(i)= gamma(j)/sigma(j); 
                             %with option to divide by volatility.
                             %PW - Always multiplied by 10 for chapter 5. 

  v1(i)=v(j)/w; v2(i)=-v(j)/w; %optional
   % time(i)=time(j+w); %07/02/16 +w removed
    date(i)=date(j+w);%07/02/16 +w removed  
    %indicator1(i)=indicator(j); %07/02/16 +w removed - it is a further shift that is not necessary.                 
    x(i)=i; i=i+1;%compute time element for plotting later on.
 
end
%Normailse the signal for display purposes.
%signal=signal./max(signal); - old way of normalising
% Remove normalising for a second signal=(signal - min(signal))/(max(signal)-min(signal));
 signal=(signal - min(signal))/(max(signal)-min(signal));
 gasoil_data_close=(gasoil_data_close - min(gasoil_data_close))/(max(gasoil_data_close)-min(gasoil_data_close));
 
 
figure(3);
plot(x,sigma,'k');
hold on;
plot(vol,'b');
%plot (sigma, 'b');
%plot(LI,'m');
legend('black = Stochastic Volatilty','blue = Garch volatility','Location','northeast')
title('Plot of Stochastic Volatility and Garch(1,1) Volatility');
grid on;
xlim ([0 1080]);
grid on; 


%Compute the zero crossing of LI. 
  z=1;
  zx=1;
profit_loss(1) = [0];
for i=2:m-1 %%NB, must start at 2 as Levy(0) can't be accessed by Matlab
    if LI(i)>0 & LI(i-1)<0 %Change of LI
         %if LI(i)<= v1(i) & LI(i+1)>=v1(i) %Change of LI
             z=z+1;
        ZC(i)=1; %Value=1 for zero crossing associated with upward trend
        price1(z)=signal(i); 
        price1b(z-1)=signal(i-1);
        event_number=event_number+[1];
        event_index(z-1)=i;
% time_event(event_number) = time(i); %time of trade
 date_event(event_number) = date(i);
 order_type(event_number)= {'buy'};
 order_price(event_number) = signal(i);
 volatility_value(event_number) = LI(i);
profit_loss(i) = (signal(i)-signal(i-1)+profit_loss(i-1));
    else
        ZC(i)=0; %Value=0 otherwise
        profit_loss(i)=profit_loss(i-1);
        
         end
         number_of_buys=z;
    
    if LI(i)<0 & LI(i-1)>0 
         %if LI(i)>=v2(i) & LI(i+1)<=v2(i) 
         z=z+1;
             zx=zx+1;
        ZC(i)=-1; %Value=-1 for zero crossing associated with downward trend
        price2(z)=signal(i); 
        %price2b(z-1)=signal(i-1);
        event_number=event_number+[1];
        event_index(z-1)=i;
 %time_event(event_number) = time(i); %time of trade
 date_event(event_number) = date(i);
 order_type(event_number)= {'sell'};
 order_price(event_number) = signal(i);
  volatility_value(event_number) = LI(i);
 profit_loss(i) = (signal(i-1)-signal(i))+profit_loss(i-1);
         end
         number_of_sells=zx;
% i=m-1;
%    price_close=signal(i); 
end
        event_number=event_number+[1];
        event_index(z)=i;
 %time_event(event_number) = time(i); %time of trade
 date_event(event_number) = date(i);
order_type(event_number)= {'close'};
order_price(event_number) = signal(i);
volatility_value(event_number)=LI(i);
%end


% %%Analysis of last price point to close poisiton as per MT4%%
%%Removing until 208 14-12-16
% A='sell';
% B=order_type(event_number);
% %%if order_type(event_number)=strcmp(A,order_type(event_number)
%     if strcmp(A,B)==1;
%         ZC(i)=-1;
%     order_price(event_number+1)= -order_price(event_number-1) + gasoil_data_close(m+w);%signal(m-1);
%     else
%     ZC(i)=1;
%     order_price(event_number+1)= order_price(event_number-1) - gasoil_data_close(m+w);%signal(m-1);
% end
% event_number=event_number+[1];
% % time_event(event_number) = time_event(event_number-1);
%  date_event(event_number)= date_event(event_number-1);
%  volatility_value(event_number)=LI(m); %Remember, LI is w points behind price signal 
%  event_index(event_number)=i;
%  order_type(event_number)= {'close'};
%  order_price(event_number)= gasoil_data_close(m+w); %%Closing data added for last point to match MT4 which cannot be reconfigured from taking closing price at this point. 


       





%%pause(0.01); end 
%try
%Compute arrays containing numerical value of signal and zero crossing
%velue (i.e. ZCV = 1 or -1) at the points where a zero crossing occurs.
k=1;%Initialize value of counter.
 ZC(m)=ZC(m-1);
for i=1:m
    if shift==0;
      if ZC(i)<0 %zero crossing at point of downward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        vy(k)=value(k);vx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i); %zero crossing value = -1 
        k=k+1;%Forward counter.
      end
    if ZC(i)>0 %zero crossing at point of upward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        
        vy(k)=value(k);vx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i);%zero crossing value = +1 
        k=k+1;
        end
     
      
    else if shift ==0.5;
       if ZC(i)<0 %zero crossing at point of downward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        wy(k)=value(k);wx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i); %zero crossing value = -1 
        k=k+1;%Forward counter.
       end
    
  if ZC(i)>0 %zero crossing at point of upward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        
        wy(k)=value(k);wx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i);%zero crossing value = +1 
        k=k+1;
        end
        end  
    
        if shift==1;
      if ZC(i)<0 %zero crossing at point of downward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        xy(k)=value(k);xx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i); %zero crossing value = -1 
        k=k+1;%Forward counter.
      end
    if ZC(i)>0 %zero crossing at point of upward trend
        value(k)=signal(i);%value of signal at point of zero crossing 
        
        xy(k)=value(k);xx(k)=i;%copy values in arrays for comparitive plot
        ZCV(k)=ZC(i);%zero crossing value = +1 
        k=k+1;
    end
    end       
end
end
k=k-1;%Note: Reducing value of k by 1 because array size is k 
      %and not k+1 after completion of process.
      
%Intialiatize back-testing evaluators.
down_good=0;
down_bad=0;
up_good=0;
up_bad=0;
%catch
%end
%Compute back-test evaluatiors.  
try
for i=2:k
    %For case when zero crossings correlate with downward trend.
    if ZCV(i-1)<0 & value(i)-value(i-1)<0
        down_good=down_good+1;%Count the number of time this occurs.
        winning_bet_neg(i)=value(i-1)-value(i);    
    else winning_bet_neg(i)=0;        
    end
    %For case when zero crossings do not correlate with downward trend.
    if ZCV(i-1)<0 & value(i)-value(i-1)>0
        down_bad=down_bad+1;%Count the number of time its does not occur.
        losing_bet_neg(i)=value(i-1)-value(i);
    else losing_bet_neg(i)=0;
    end
end
catch
end
%%if order_type(event_number)=strcmp(A,order_type(event_number)
try
% Code to be executed goes here.
A='sell';
B=order_type(event_number-1);
 
 
if strcmp(A,B)==1
        if(order_price(event_number-1) - gasoil_data_close(m+w))>0;
    winning_bet_neg(i+1)= order_price(event_number-1) - gasoil_data_close(m+w);
    winning_bet_pos(i+1)=0;losing_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;
        else
    losing_bet_neg(i+1)= order_price(event_number-1) - gasoil_data_close(m+w);
    winning_bet_pos(i+1)=0;losing_bet_pos(i+1)=0;winning_bet_neg(i+1)=0;
        end
end
    catch
    disp('An error occurred while retrieving information from the internet.');
    disp('Execution will continue.');
end

for i=2:k
    %For case when zero crossings correlate with upward trend.
    if ZCV(i-1)>0 & value(i)-value(i-1)>0
        up_good=up_good+1;%Count the number of time this occurs.
        winning_bet_pos(i)=value(i)-value(i-1);   
    else winning_bet_pos(i)=0;
      
    end
    %For case when zero crossings do not correlate with upward trend.
    if ZCV(i-1)>0 & value(i)-value(i-1)<0
        up_bad=up_bad+1;%Count the number of time this occurs.
         losing_bet_pos(i)=value(i)-value(i-1); 
         else losing_bet_pos(i)=0;
    end
end

try
C='buy';
D=order_type(event_number-1);
%end
%%if order_type(event_number)=strcmp(A,order_type(event_number)
    if strcmp(C,D)==1
        if (-order_price(event_number-1) + gasoil_data_close(m+w))>0;
    winning_bet_pos(i+1)= -order_price(event_number-1) + gasoil_data_close(m+w);
    losing_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;winning_bet_neg(i+1)=0;
else
    losing_bet_pos(i+1)= -order_price(event_number-1) + gasoil_data_close(m+w);
    winning_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;winning_bet_neg(i+1)=0;
        end
    end
  catch
    disp('An error occurred while retrieving information from the internet.');
    disp('Execution will continue.');
end
for i=1:k;
tally1(i) = winning_bet_neg(i) + losing_bet_neg(i) + winning_bet_pos(i) + losing_bet_pos(i);
tally2(i) = sum(tally1(i));
tally3(i)=sum(tally2);
end
for q= 1:size(spDate);
    dateLad(q)=q;
    
end
sp=(sp - min(sp))/(max(sp)-min(sp));
tally3=(tally3 - min(tally3))/(max(tally3)-min(tally3));
try
%ZC_plot(m)=ZC(m-1); %End condition for zero crossing array ==21/02/16 
  ZC(m)=ZC(m-1);
  profit_loss(i+1)=profit_loss(i);
%Plot the result for graphical diagnosis - signal, LI and positions of 
%zero crossing in terms of ZC = +1 or -1 or 0 otherwise.
figure(1); 

plot(x,signal,'b',x,LI,'r',x,sigma,'k',wx,tally3,'-m.',dateLad,sp,'k',x,ZC,'g',x,v2,'m','Markersize',15);
%plot(x,signal,'b-',x,LI,'r-',x,ZC_plot,'g-',x,v1,'m',x,v2,'m',x,gamma_no_MA*100);
%plot(x,signal,'b-',x,LI,'r-',x,ZC,'g-',x,v1,'m',x,v2,'m');
legend('blue = Price Signal','red = Alpha Index','black = Volatility','magenta = Profit','black = S&P500','Location','southwest')
grid on;
xlim ([0 940]);
ylim ([-1 1]);
catch
end






















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%This section writes the output to Excel

% T=table(winning_bet_neg, down_good,down_bad, up_good, down_good)
% row_names= {'winning_bet_neg'; 'losing_bet_neg'; 'winning_bet_pos';'losing_bet_pos'};
% tab ={winning_bet_neg(:),losing_bet_neg(:),winning_bet_pos(:), losing_bet_pos(:)};
% tab ={winning_bet_neg,losing_bet_neg,winning_bet_pos, losing_bet_pos};

% T=table(winning_bet_neg(:), losing_bet_neg(:), winning_bet_pos(:), losing_bet_pos(:))
% T=cell2table(tab)
% out={transpose(winning_bet_neg), transpose(losing_bet_neg)};
try
names = {'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive', 'Losing Bet Positive'};
out=padcat(winning_bet_neg',losing_bet_neg',winning_bet_pos', losing_bet_pos');
out1=[sum(winning_bet_neg),sum(losing_bet_neg),sum(winning_bet_pos), sum(losing_bet_pos)];
%%normalised_out1=sum(out1)*(max(data)-min(data))+min(data);
%filename='Shift_From_Matlab.xlsx';
%xlswrite(filename, names,'B1:E1')
%xlswrite(filename,out,'B2:E15')
%xlswrite(filename,datarange,'A18:A18')

print_table(out,{'%.3g'},{'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive','Losing Bet Positive'},'printMode','latex')
%%print_table(out1,{'%.3g'},{'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive','Losing Bet Positive'},'printMode','latex')
overall_profit_or_loss=sum(out1)
catch 
end


try
%Compute the percentage accuracy of forecasting exits correctly,
%i.e. number of downward trends correctly predicted.
if (double(down_good)+double(down_bad))>0
Exits_Accuracy=...
100*double(down_good)/(double(down_good)+double(down_bad))
else
    Exits_Accuracy=0
end
%Compute the percentage accuracy of forecasting entries correctly,
%i.e. number of upward trends correctly predicted.
if (double(up_good)+double(up_bad))>0
Entries_Accuracy=...
100*double(up_good)/(double(up_good)+double(up_bad))
Combined_Accuracy=(Exits_Accuracy+Entries_Accuracy)/2
else
    Entries_Accuracy=0.0
end
catch 
end
%Plot trends that have been predicted and compare them with
%the original data to give a graphical comparison of 
%correct/incorrect predictions.

figure(2); 

if shift ==0;
plot(vx,vy,'r-',x,signal,'b-');
hold on;
elseif shift ==0.5;
 plot(x,signal,'b-',wx,wy,'g-');   
xlim([0 1050]);
hold on
grid on; 
legend('blue = Price Signal','green = Price at time of Zero Crossing','Location','southwest');
title('Price at time of trade for easy visualisation of correct/incorrect trading decision');
end
if shift ==1;
plot(xx,xy,'b-',x,signal,'b-');
hold on;

end

 
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%This section will print to the general results Excel spreadsheet. 
