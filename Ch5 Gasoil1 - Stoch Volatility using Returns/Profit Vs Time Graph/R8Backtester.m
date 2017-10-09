
function R8Backtester(w,shift,gasoil_data,gaoil_data_close,offset,ma,excel_row,excel_columnc,excel_columnd,excel_columne,excel_columnf,excel_columng,excel_columnh,excel_columni,excel_columnj)%,date)%gaoil_data_close,excel_row,date,time,indicator)
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
%sigma(i)=volatility(s,w);
v(i)=varstatus*variance(s,w);
% t(i) = time(i);
% d(i) = date(i);
 
%End the moving window process.
end
%PW - Feb 15 Remove the Filter...Levy index and volatility using a moving avarege filter
try
if ma == 1;
gamma=movav_R1(gamma,m,ww,shift);
else gamma=gamma;
end
%sigma=movav(sigma,m,ww,shift);
catch end



%gamma=conv(gamma,filter,'same');%Filter with function MATLAB function conv.
%sigma=conv(sigma,filter,'same');
%Prepare the original signal and Levy index LI (divided by volatility - optional).
i=1;%Initialise value of counter.
for j=1:m %PW m changed to n for ALL data points
%for j=1:m
    signal(i)=data(j+w); %PW removed 01/03/15 +w);%Read data in window into signal array.
    LI(i)= gamma(j)*100;%/sigma(j); %LI = Levy Index in given window
                             %with option to divide by volatility.
                             %PW - Always multiplied by 10 for chapter 5. 

  v1(i)=v(j)/w; v2(i)=-v(j)/w; %optional
%     time(i)=time(j+w); %07/02/16 +w removed
%    date(i)=date(j+w);%07/02/16 +w removed  
    %indicator1(i)=indicator(j); %07/02/16 +w removed - it is a further shift that is not necessary.                 
    x(i)=i; i=i+1;%compute time element for plotting later on.
 
end
%Normailse the signal for display purposes.
%signal=signal./max(signal); - old way of normalising
% Remove normalising for a second signal=(signal - min(signal))/(max(signal)-min(signal));
 %signal=(signal - min(signal))/(max(signal)-min(signal));
%Compute the zero crossing of LI. 
  z=1;
  zx=1;
for i=2:m-1 %%NB, must start at 2 as Levy(0) can't be accessed by Matlab
    if LI(i)>0 & LI(i-1)<0 %Change of LI
         %if LI(i)<= v1(i) & LI(i+1)>=v1(i) %Change of LI
             z=z+1;
        ZC(i)=1; %Value=1 for zero crossing associated with upward trend
        price1(z)=signal(i); 
        price1b(z-1)=signal(i-1);
        event_number=event_number+[1];
% time_event(event_number) = time(i); %time of trade
 %date_event(event_number) = date(i);
 order_type(event_number)= {'buy'};
 order_price(event_number) = signal(i);
    else
        ZC(i)=0; %Value=0 otherwise
         end
         number_of_buys=z;
    
    if LI(i)<0 & LI(i-1)>0 
         %if LI(i)>=v2(i) & LI(i+1)<=v2(i) 
             zx=zx+1;
        ZC(i)=-1; %Value=-1 for zero crossing associated with downward trend
        price2(z)=signal(i); 
        %price2b(z-1)=signal(i-1);
        event_number=event_number+[1];
 %time_event(event_number) = time(i); %time of trade
% date_event(event_number) = date(i);
 order_type(event_number)= {'sell'};
 order_price(event_number) = signal(i);
         end
         number_of_sells=zx;
% i=m-1;
%    price_close=signal(i); 
end
        event_number=event_number+[1];
% time_event(event_number) = time(i); %time of trade
% date_event(event_number) = date(i);
order_type(event_number)= {'close'};
order_price(event_number) = gaoil_data_close(m+w);
%end


% %%Analysis of last price point to close poisiton as per MT4%%
% A='sell';
% B=order_type(event_number);
% %%if order_type(event_number)=strcmp(A,order_type(event_number)
%     if strcmp(A,B)==1;
%         ZC(i)=-1;
%     order_price(event_number+1)= -order_price(event_number-1) + gaoil_data_close(m+w);%signal(m-1);
%     else
%     ZC(i)=1;
%     order_price(event_number+1)= order_price(event_number-1) - gaoil_data_close(m+w);%signal(m-1);
% end
% event_number=event_number+[1];
% % time_event(event_number) = time_event(event_number-1);
% % date_event(event_number)= date_event(event_number-1);
%  order_type(event_number)= {'close'};
%  order_price(event_number)= gaoil_data_close(m+w); %%Closing data added for last point to match MT4 which cannot be reconfigured from taking closing price at this point. 


       




try
ZC_plot(m)=ZC(m-1); %End condition for zero crossing array ==21/02/16 
  
%Plot the result for graphical diagnosis - signal, LI and positions of 
%zero crossing in terms of ZC = +1 or -1 or 0 otherwise.
figure(1); 

plot(x,signal,'b-',x,LI,'r-',x,ZC_plot*100,'g-',x,v1,'m',x,v2,'m',x,signal-signal(0));%,x,gamma_no_MA*100);
legend('blue = Price Signal','red = Levy Index','Location','southwest')
grid on;
%hold on;
catch
end
%%pause(0.01); end 
try
%Compute arrays containing numerical value of signal and zero crossing
%velue (i.e. ZCV = 1 or -1) at the points where a zero crossing occurs.
k=1;%Initialize value of counter.
 ZC(m)=ZC(m-1);
for i=1:m
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
end
k=k-1;%Note: Reducing value of k by 1 because array size is k 
      %and not k+1 after completion of process.
      
%Intialiatize back-testing evaluators.
down_good=0;
down_bad=0;
up_good=0;
up_bad=0;
catch
end
%Compute back-test evaluatiors.  
try
for i=2:k
    %For case when zero crossings correlate with downward trend.
    if ZCV(i-1)<0 & value(i)-value(i-1)<0
        down_good=down_good+1;%Count the number of time this occurs.
        winning_bet_neg(i)=value(i-1)-value(i);
       % winning_bet_neg_date(i)=;
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
        if(order_price(event_number-1) - gaoil_data_close(m+w))>0;
    winning_bet_neg(i+1)= order_price(event_number-1) - gaoil_data_close(m+w);
    winning_bet_pos(i+1)=0;losing_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;
        else
    losing_bet_neg(i+1)= order_price(event_number-1) - gaoil_data_close(m+w);
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
        if (-order_price(event_number-1) + gaoil_data_close(m+w))>0;
    winning_bet_pos(i+1)= -order_price(event_number-1) + gaoil_data_close(m+w);
    losing_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;winning_bet_neg(i+1)=0;
else
    losing_bet_pos(i+1)= -order_price(event_number-1) + gaoil_data_close(m+w);
    winning_bet_pos(i+1)=0;losing_bet_neg(i+1)=0;winning_bet_neg(i+1)=0;
        end
    end
  catch
    disp('An error occurred while retrieving information from the internet.');
    disp('Execution will continue.');
end


%%This section keeps track of the incident number%%
%We want to keep a count of the number of open/close buy/sell decisions as
%they occur


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%This section writes the output to Excel

% T=table(winning_bet_neg, down_good,down_bad, up_good, down_good)
% row_names= {'winning_bet_neg'; 'losing_bet_neg'; 'winning_bet_pos';'losing_bet_pos'};
% tab ={winning_bet_neg(:),losing_bet_neg(:),winning_bet_pos(:), losing_bet_pos(:)};
% tab ={winning_bet_neg,losing_bet_neg,winning_bet_pos, losing_bet_pos};

% T=table(winning_bet_neg(:), losing_bet_neg(:), winning_bet_pos(:), losing_bet_pos(:))
% T=cell2table(tab)
% out={transpose(winning_bet_neg), transpose(losing_bet_neg)};
%try
names = {'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive', 'Losing Bet Positive'};
out=padcat(winning_bet_neg',losing_bet_neg',winning_bet_pos', losing_bet_pos');
out1=[sum(winning_bet_neg),sum(losing_bet_neg),sum(winning_bet_pos), sum(losing_bet_pos)];
%dates=padcat(winning_bet_neg_date',losing_bet_neg_date',winning_bet_pos_date', losing_bet_pos_date');
%%normalised_out1=sum(out1)*(max(data)-min(data))+min(data);
filename='Shift_From_Matlab.xlsx';
xlswrite(filename, names,1,'B1:E1')
xlswrite(filename,out,1,'B2:E31')
%xlswrite(filename,dates,1,'F2:F15')
xlswrite(filename,datarange,1,'A32:A32')

print_table(out,{'%.3g'},{'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive','Losing Bet Positive'},'printMode','latex')
%%print_table(out1,{'%.3g'},{'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive','Losing Bet Positive'},'printMode','latex')
overall_profit_or_loss=sum(out1)
%catch 
%end


%try
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
%catch 
%end
%Plot trends that have been predicted and compare them with
%the original data to give a graphical comparison of 
%correct/incorrect predictions.

%figure(2); 
%plot(vx,vy,'r-',x,signal,'b-');
%grid on; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%This section will print to the general results Excel spreadsheet. 
% filename='Detailed_R0_Trading strategy results.xlsx'
% %Interval% 
% %manual enter
% %Moving Window
% xlswrite(filename,w,1,'C8')
% %Shift
% xlswrite(filename,shift,1,'D8')
% %Movav
% %manual enter
% %Entries
% xlswrite(filename,Entries_Accuracy,1,'F8')
% %Exits
% xlswrite(filename,Exits_Accuracy,1,'G8')
% %Profitability
% xlswrite(filename,overall_profit_or_loss,1,'I8')
% %Buys
% xlswrite(filename,number_of_buys,1,'J8')
% %Sells
%  xlswrite(filename,number_of_sells,1,'K8')
 
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%This section will print to the general results Excel spreadsheet. 
% filename='C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 MT4_Matlab Trading Backtest\Matlab Code\5.8\Detailed_R0_Trading strategy results.xlsx'
% %For Mac
% %filename='/Users/paddywalsh/Dropbox/Further Study/Thesis/myfiles/Ch5/Tests/Detailed MT4 Comparison/Detailed_R0_Trading strategy results.xlsx'
% %filename='Detailed_R0_Trading strategy results.xlsx'
% % %Interval% 
% % %manual enter
% % %Moving Window
% % xlswrite(filename,w,3,'C8')
% % %Shift
% % xlswrite(filename,shift,3,'D8')
% % %Movav
% % %manual enter
% % %Entries
% % xlswrite(filename,Entries_Accuracy,3,'F8')
% % %Exits
% % xlswrite(filename,Exits_Accuracy,3,'G8')
% % %Profitability
% % xlswrite(filename,overall_profit_or_loss,3,'I8')
% % %Buys
% % xlswrite(filename,number_of_buys,3,'J8')
% % %Sells
% %  xlswrite(filename,number_of_sells,3,'K8')
%  
% % filename='Test_R0_Trading strategy results.xlsx'
%  A = 4;
%  toplefts = [excel_row];
% % %Interval% 
% % %manual enter
% % %Moving Window
% % range = XLSrange(size(A),[toplefts,2]);
% % xlswrite(filename,w,3,range)
% % %Shift
% % range = XLSrange(size(A),[toplefts,3]);
% % xlswrite(filename,shift,3,range)
% % 
% % %Entries
% % range = XLSrange(size(A),[toplefts,5]);
% % xlswrite(filename,Entries_Accuracy,3,range) %F82
% % %Exits
% % range = XLSrange(size(A),[toplefts,6]);
% % xlswrite(filename,Exits_Accuracy,3,range) %G82
% % %Profitability
% % range = XLSrange(size(A),[toplefts,8]);
% % xlswrite(filename,overall_profit_or_loss,3,range)
% % %Buys
% % range = XLSrange(size(A),[toplefts,9]);
% % xlswrite(filename,number_of_buys,3,range)
% % %Sells
% % range = XLSrange(size(A),[toplefts,10]);
% %  xlswrite(filename,number_of_sells,3,range)
 

% %%here we'll create the loop to write to XLS at each incident number
% A = 4;
% for event_number = 1:1:event_number;
% %     te=1:1:size(time_event);
% %     date = 1:1:size(date_event);
% %     time_event(te); 
%     excel_row=excel_row+1; 
%     toplefts = [excel_row];
%  %Interval% 
% %manual enter
% %Event Number
% range = XLSrange(size(A),[toplefts,2]);
% xlswrite(filename,event_number,3,range)
% %Time
% range = XLSrange(size(A),[toplefts,3]);
% xlswrite(filename,time_event(event_number),3,range)
% %Date
% range = XLSrange(size(A),[toplefts,4]);
% xlswrite(filename,date_event(event_number),3,range) %F82
% %Order Type (Buy or Sell)
% range = XLSrange(size(A),[toplefts,5]);
% xlswrite(filename,order_type(event_number),3,range) %G82
% % %Order Number ....come back to
% % range = XLSrange(size(A),[toplefts,6]);
% % xlswrite(filename,'NA',3,range)
% % %Size...come back to
% % range = XLSrange(size(A),[toplefts,7]);
% % xlswrite(filename,'NA',3,range)
% %Price
% range = XLSrange(size(A),[toplefts,8]);
%  xlswrite(filename,order_price(event_number),3,range)
% end


% %%Special Plot for comparing MT4 and Matlab Levy index. 
% 
% %Firstly, import the Levy data from MT4 in excel spreadsheet. 
% figure(3)
% subplot(3,1,1)
% plot(x,(indicator1*10),'r-');
% axis([0 200 -0.4 0.4]);
% legend('Data from MT4 red = Levy Index','Location','southwest')
% grid on;
% subplot(3,1,2)
% plot(x,LI,'g-');
% axis([0 200 -0.4 0.4]);
% legend('Data from Matlab green = Levy Index','Location','southwest')
% grid on;
% subplot(3,1,3)
% plot(x,LI,'g-',x,(indicator1*10),'r');
% grid on;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%This section will print to the general results Excel spreadsheet. 
filename='R0_Trading strategy results_Avg_tester_R1.xlsx'
%Interval% 
%manual enter
%Moving Window
A=4;
toplefts = [excel_row];
%xlswrite(filename,w,1,sprintf('excel_columnc',excel_row))
%range = XLSrange(size(A),[4,excel_columnd]);
try
range = XLSrange(size(A),[excel_row,excel_columnc]);
xlswrite(filename,w,1,range)
%Shift
range = XLSrange(size(A),[excel_row,excel_columnd]);
xlswrite(filename,shift,1,range)
%Movav
range = XLSrange(size(A),[excel_row,excel_columne]);
xlswrite(filename,ma,1,range)
%Entries
range = XLSrange(size(A),[excel_row,excel_columnf]);
xlswrite(filename,Entries_Accuracy,1,range)
%Exits
range = XLSrange(size(A),[excel_row,excel_columng]);
xlswrite(filename,Exits_Accuracy,1,range)
%Profitability
range = XLSrange(size(A),[excel_row,excel_columnh]);
xlswrite(filename,overall_profit_or_loss,1,range)
%Buys
range = XLSrange(size(A),[excel_row,excel_columni]);
xlswrite(filename,number_of_buys,1,range)
%Sells
range = XLSrange(size(A),[excel_row,excel_columnj]);
 xlswrite(filename,number_of_sells,1,range)
catch
end