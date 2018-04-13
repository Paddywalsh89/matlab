
function R11Backtester_Volatility_Econometrics (signalName, sp500Date, sp500Index,spGsciIndex,w,shift,data,gasoil_data_close,date,offset,ma,mmdate,returnsSignal,interestFreeRate,interestFreeRateDaily)
% R11 just differs from 10 in that it does include sp500 and GSCI data
% as I haven't used these for HH data analysis. 

%% 1.   Intro: Back-testing procedure for Levy_Index/volatility indicator performance
% w - size of moving window: Default w=20
% w sets length of look-back window for (moving avarege) filtering of 
% Levy Index and Stochastic Volatility
% shift - shift of moving average filter 0<shift<1: Default shift=0.5 
% shift=0 gives fully dynamic trading
% shift=1 give fully static trading strategy
%% 2.   Read INPUT PARAMETERS.
datarange={'Daily Gasoil data, Monday 4th Oct 2010 - Wednesday 01th Oct 2014'};
%data=gasoil_data; %note, not returns signal. 
[n]= numel(data);
nn = 1:numel(data); % For Fig 2
% 1. Obtain size of S&P500 Time Series (Why are there more values than Gasoil? 1006v941 Ans: 
% From checking Gasoil excel data there are more data points for SP500) 
dateLad= 1:numel(sp500Index);
% event_number keeps track of the buy/sell open/close events and number them.
event_number=[0]; 
%% 3.   Compute the windowed Levy Index Stoch. Vol.
m=n-w;
for i=1:m  
% Matlab completes this iteration first. i.e. data(1+1,1+2,..1+j), 
% then data((i+1)+1,(i+1)+2,+...(i+1)+j)
% Window the data. 
for j=1:w  
s(j)=data(i+j);
end
% Compute the Levy Index 
gamma(i)=Levyindex(s,w);
gamma_no_MA(i)=Levyindex(s,w);

% Compute the Stochastic Volatilty (optional)
% Set status of variance of Levy index to:
varstatus=0; %variance=1 is on, variance=0 is off;
%stoch_sigma(i)=R1volatility(s,w); %Moved to Section 3.5 
v(i)=varstatus*variance(s,w);
end
%% 3.5  Compute the window Stoch Vol (Based on returns)
for i=1:m-1
% Window the data. 
for j=1:w  
r(j)=returnsSignal(i+j);
end
stoch_sigma(i)=R2volatility(r,w);
%End the moving window process.
end
y=1:length(stoch_sigma);
%% 4    GARCH: Compute Volatility using the GARCH model. (Optional) 
%MdlG = garch(1,1); % normal innovations
MdlT = garch(1,1); % t-distributed innovations
MdlT.Distribution = 't';
%% 4.1  GARCH: Garch Parameters estimation (Optional) 
for i=1:m
    s(i)=returnsSignal(i+1); %note: normally use returns, not price directly. 
end
r=transpose(s);
EstMdlT = estimate(MdlT,r);
%% 4.2  GARCH: Volatility inference and log-likelihood objective function value from estimated GARCH model
%[vG,logLG] = infer(EstMdlG,r);
[garch_sigma,logLT] = infer(EstMdlT,r);
%% 5.   Define whether using Stoch Vol or garch_sigma
sigma=stoch_sigma; 
%% 6.   Compute moving avg. of Gamma & Sigma
%try
if ma ==1;
gamma=movav_R1(gamma,m,w,shift);
stoch_sigma=movav_R1(stoch_sigma,m-1,w,shift);
garch_sigma=movav_R1(garch_sigma,m-1,w,shift);
else
    gamma=gamma;
    sigma=sigma;
end
%catch
%end
%% 7.   Prepare Gasoil & Alpha for Plot
i=1;% Initialise value of counter.
for j=1:m 
    signal(i)=data(j+w);      %(j+w) chosen as LI starts after w instances. 
    LI(i)= gamma(j)*10;%/sigma(j); % PW - Always multiplied by 10 for chapter 5. 
       
    % optional for trading @volatility rather than zero crossing.
    v1(i)=v(j)/w; v2(i)=-v(j)/w; 
    
    % time(i)=time(j+w);
    date(i)=date(j+w);          % Date for plot
    %mmmdate(i)=mmdate(j+w);     % Date for plot          
    x(i)=i; i=i+1;              % Compute time element for plotting later on.
end
%% 8.   Normalise all signals for display purposes
 signal_norm=(signal - min(signal))/(max(signal)-min(signal));
 % signal=signal./max(signal); - old way of normalising
 %LI_norm=(LI - min(LI))/(max(LI)-min(LI)); 
 %Note, there is no point in normalising from [0 1] as we need zero crossings. 
 LI_norm = normalised_diff(LI); %Instead normalise between -1 and 1
 sigma_norm=(sigma - min(sigma))/(max(sigma)-min(sigma));
 gasoil_data_close=(gasoil_data_close - min(gasoil_data_close))/(max(gasoil_data_close)-min(gasoil_data_close));
%% 9a.   PLOT: Figure 1 - Volatility Comparison: Gamma, Stoch Volatility, Garch Vol, and LI (Gamma/Volatility) 
plot(x,gamma,'k',x,LI,'r');
xlim ([0 1200]);
title('Alpha Signal and Volatility based on Price Signal');
legend('Black = Stochastic','Red=Alpha','Location','northeast');
grid on;
%% 9b.   PLOT: Figure 1 - Volatility Comparison: Gamma, Stoch Volatility, Garch Vol, and LI (Gamma/Volatility) 
figure11 = figure;
subplot13 = subplot(2,1,1,'Parent',figure11);
hold(subplot13,'on');
plot(x,r,'k');
title('Gasoil Returns Signal');
grid on;
hold(subplot13,'on');
subplot12 = subplot(2,1,2,'Parent',figure11);
hold(subplot13,'on');
plot(y,stoch_sigma,'k',y,garch_sigma,'g');
title('Volatility based on Price Returns Signal');
legend('Black = Stochastic','Green =Garch','Location','northeast')

%legend('Black = Stochastic','Green =Garch','Location','northeast')


grid on;
%% 10.  TRADING: Set Trading Conditions
%% 10.1 TRADING: Set counters 
z=1; % z counts the buy/sell event number
zb=1; % zx counts the number of buys
zs=1; % zx counts the number of sells
profit_loss(1) = [0]; % records to profit or loss at each trade open/close
%% 10.2 TRADING: Start Trading Loop
for i=2:m-1 %%NB, must start at 2 as Levy(0) can't be accessed by Matlab **(why only go as far as m-1?) 
%% 10.2.1 Set Buy Conditions 
  if LI(i)>0 & LI(i-1)<0 % Buy Zero crossing based trading
        %% 10.2.2 Event Count MetaData for Excel  
        % if LI(i)<= v1(i) & LI(i+1)>=v1(i) %Change of LI
        z=z+1;              % Increase trade counter 'z'
        zb=zb+1;            % Increase buy trade counter 'z'
        ZC(i)=1;            % Value=1 for zero crossing associated with upward trend
        % Note Price1,1b and 2 not actually used anywhere. 
        price1(z)=signal(i);% Normalised price at time time of trade
        price1b(z-1)=signal(i-1); % Normalised price at time time of trade
        event_number=event_number+[1]; % Event counter 
        event_index(z-1)=i; % Event index **(how is this diff to event number?)    
        %% 10.2.3 Event Time/Price MetaData for Excel  
        % time_event(event_number) = time(i); % time of trade
        date_event(event_number) = date(i);
        order_type(event_number)= {'buy'};
        order_price(event_number) = signal(i);
        volatility_value(event_number) = LI(i);
        profit_loss(i) = (signal(i)-signal(i-1)+profit_loss(i-1)); % running tally
    else
        ZC(i)=0; % Value=0 otherwise
        profit_loss(i)=profit_loss(i-1);
  end
number_of_buys=zb;
%% 10.2.2 Set Sell Conditions
    if LI(i)<0 & LI(i-1)>0 % Sell Zero Crossing
        %% 10.2.4 Event Count MetaData for Excel
        % if LI(i)>=v2(i) & LI(i+1)<=v2(i) 
        z=z+1;
        zs=zs+1;
        ZC(i)=-1; %Value=-1 for zero crossing associated with downward trend
        price2(z)=signal(i); 
        %price2b(z-1)=signal(i-1);
        event_number=event_number+[1];
        event_index(z-1)=i;
        %% 10.2.5 Event Time/Price MetaData for Excel
        % time_event(event_number) = time(i); %time of trade
        date_event(event_number) = date(i);
        order_type(event_number)= {'sell'};
        order_price(event_number) = signal(i);
        volatility_value(event_number) = LI(i);
        profit_loss(i) = (signal(i-1)-signal(i))+profit_loss(i-1);
    end
number_of_sells=zs; 
end
%% 10.3 TRADING: Close Trade @ Series End **((i+1) added to end series at 921 instead of 920**
event_number=event_number+[1]; %Set event number for closing trade
event_index(z)=i+1;
%time_event(event_number) = time(i); %time of trade
date_event(event_number) = date(i+1);
order_type(event_number)= {'close'};
order_price(event_number) = signal(i+1);
volatility_value(event_number)=LI(i+1); 
%% 10.4 TRADING: Unused - Closing pt analysis
% See R9 for details.
%% 11.  Analysis of trades 
% For details of different shift values see R9. 
% Compute arrays containing numerical value of signal and zero crossing
% value (i.e. ZCV = 1 or -1) at the points where a zero crossing occurs.
k=1;% Initialize value of counter.
ZC(m)=ZC(m-1); %**(what is the purpose of this?) 
for i=1:m 
%% 11.1.1 Sell Trade MetaData
    if ZC(i)<0                  % zero crossing at point of downward trend
        value(k)=signal(i);     % value of signal at point of zero crossing 
        wy(k)=value(k);wx(k)=i; % Figure 3: Price Signal vs. Trades. 
        ZCV(k)=ZC(i);           % zero crossing value = -1 
        k=k+1;                  % Forward counter.
    end
%% 11.1.2 Buy Trade MetaData
    if ZC(i)>0                  % zero crossing at point of upward trend
        value(k)=signal(i);     % value of signal at point of zero crossing 
        wy(k)=value(k);wx(k)=i; % Figure 3: Price Signal vs. Trades.
        ZCV(k)=ZC(i);           %zero crossing value = +1 
        k=k+1;
    end      
end
%% 11.1 Analysis: Attribute each day to Buy or Sell Daily P&L
% For every day in the trading period - calc the P or L return
indicator=[]; %Set up blank vector for +1 or -1 
for i=1:m
%% 11.1.1   If we are in a Buy, mark Indicator(i) as 1.     
    if ZC(i)==1;
            indicator(i)=1;
            buyPrice(i)=signal(i);
            buy=i+1;
        while ZC(buy)==0 && buy < length(ZC);  
            indicator(buy)=1; 
            buyPrice(buy)=buyPrice(buy-1);
            buy=buy+1;
        end
%% 11.1.2   If we are in a Sell, mark Indicator(i) as -1.
    else if ZC(i)==-1;
            indicator(i)=-1;
            sellPrice(i)=signal(i);
            sell=i+1;
         while ZC(sell)==0 && sell < length(ZC);
                indicator(sell)=-1;
                sellPrice(sell)=sellPrice(sell-1);
                sell=sell+1;
         end
     end
    end
   
end
count=1:length(indicator);
%% 11.2 Analysis: Daily P&L
for i=1:m-1
    if indicator(i)==1;
        dailyReturn(i)=signal(i)-buyPrice(i);
        dailyReturnReturn(i)=dailyReturn(i)/buyPrice(i);
        else if indicator(i)==-1;
            dailyReturn(i)=sellPrice(i)-signal(i); 
            dailyReturnReturn(i)=dailyReturn(i)/sellPrice(i);
            end
    end
    if indicator(i)==0;
        dailyReturn(i)=0; 
    end
end
%% 11.3 Analysis: Daily P&L - sp500 & spGsci
for i=1:length(sp500Index)-1                             %note n as I am looking at the last trading point, no windowing here. 
    
        dailyReturnSp500(i)=sp500Index(i)-sp500Index(1);
        dailyReturnReturnSp500(i)=dailyReturnSp500(i)/sp500Index(1);
        dailyReturnGsci(i)=spGsciIndex(i)-spGsciIndex(1);
        dailyReturnReturnGsci(i)=dailyReturnGsci(i)/spGsciIndex(1);
        
        
      
end
%% 12.  Backtesting 
% Intialiatize back-testing evaluators.
down_good=0;
down_bad=0;
up_good=0;
up_bad=0;
k=k-1;          % Note: Reducing value of k by 1 because array size is k 
                % and not k+1 after completion of step 11. 
%% 12.1 BACKTESTING: Sell Trade Correct/Incorrect Analysis  
for i=2:k
%% 12.1.1 Correct Sell Trade   
    if  ZCV(i-1)<0 & value(i)-value(i-1)<0
        down_good=down_good+1;% Count the number of time this occurs.
        winning_bet_neg(i)=value(i-1)-value(i);    
    else winning_bet_neg(i)=0;        
    end
%% 12.1.2 Incorrect Sell Trade
    if ZCV(i-1)<0 & value(i)-value(i-1)>0
        down_bad=down_bad+1;  %Count the number of time its does not occur.
        losing_bet_neg(i)=value(i-1)-value(i);
    else losing_bet_neg(i)=0;
    end
end
%% 12.2 BACKTESTING: Closing Price for Sell Trades Analysis  
try
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
%% 12.3 BACKTESTING: Buy Trade Correct/Incorrect Analysis
for i=2:k
%% 12.3.1 Correct Sell Trade 
    if ZCV(i-1)>0 & value(i)-value(i-1)>0
        up_good=up_good+1;%Count the number of time this occurs.
        winning_bet_pos(i)=value(i)-value(i-1);   
    else winning_bet_pos(i)=0;
    end
%% 12.3.2 Incorrect Buy Trade
    %For case when zero crossings do not correlate with upward trend.
    if ZCV(i-1)>0 & value(i)-value(i-1)<0
        up_bad=up_bad+1;%Count the number of time this occurs.
         losing_bet_pos(i)=value(i)-value(i-1); 
         else losing_bet_pos(i)=0;
    end
end
%% 12.4 BACKTESTING: Closing Price for Buy Trades Analysis
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
%% 12.5 BACKTESTING: Normalised Tallies
for i=1:k;
tally1(i) = winning_bet_neg(i) + losing_bet_neg(i) + winning_bet_pos(i) + losing_bet_pos(i);
tally2(i) = sum(tally1(i));
tally3(i)=sum(tally2);
end
%% 13.  PLOT: Figure 2: Prep - signal, LI and positions of ZC
% 1. Normalise the S&P500 & Alpha Signal for Figure 2
sp500_norm=(sp500Index - min(sp500Index))/(max(sp500Index)-min(sp500Index));
tally3_norm=(tally3 - min(tally3))/(max(tally3)-min(tally3));

% 2. Set end condition for zero crossing array ==21/02/16 
ZC(m)=ZC(m-1);                   % **(why (m-1)? Is this because I don't use closing value?)
profit_loss(i+1)=profit_loss(i); % ** same q as above? 
%% 13.1 PLOT: Figure 2: Backtesting Performance Plot
figure(12); 
plot(x,signal_norm,'b',x,LI,'r',wx,tally3_norm,'-m.',dateLad,sp500_norm,'k',count,indicator,'-c',x,ZC,'g',x,v2,'m','Markersize',15);
% plot(x,signal,'b',x,LI_norm,'r',x,sigma_norm,'k',wx,tally3,'-m.',dateLad,sp,'k',x,ZC,'g',x,v2,'m','Markersize',15);
% plot(x,signal,'b-',x,LI,'r-',x,ZC_plot,'g-',x,v1,'m',x,v2,'m',x,gamma_no_MA*100);
legend('blue = Price Signal','red = Alpha Index','magenta = Profit','black = S&P500','Location','southwest')
grid on;
xlim ([0 940]);
ylim ([-1 1]);
%% 14   Write Trade Analysis Table to Command Line  
% To write this table to Excel, see R9.
names = {'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive', 'Losing Bet Positive'};
out=padcat(winning_bet_neg',losing_bet_neg',winning_bet_pos', losing_bet_pos');
out1=[sum(winning_bet_neg),sum(losing_bet_neg),sum(winning_bet_pos), sum(losing_bet_pos)];
print_table(out,{'%.3g'},{'Winning Bet Negative','Losing Bet Negative','Winning Bet Positive','Losing Bet Positive'},'printMode','latex')
overall_profit_or_loss=sum(out1)
%% 15   Write Overall % of correct Buy/Sell Trades to Command Line  
%   This section builds on Section 12. 
try
%   Compute the percentage accuracy of forecasting exits correctly,
%   i.e. number of downward trends correctly predicted.
if (double(down_good)+double(down_bad))>0
    Exits_Accuracy=...
    100*double(down_good)/(double(down_good)+double(down_bad))
else
    Exits_Accuracy=0
end
%   Compute the percentage accuracy of forecasting entries correctly,
%   i.e. number of upward trends correctly predicted.
if (double(up_good)+double(up_bad))>0
    Entries_Accuracy=...
    100*double(up_good)/(double(up_good)+double(up_bad))
    Combined_Accuracy=(Exits_Accuracy+Entries_Accuracy)/2
else
    Entries_Accuracy=0.0
end
catch 
end
%% 16   PLOT: Figure 3: Buy/Sell Trends vs Signal
% Plot trends that have been predicted and compare them with
% the original data to give a graphical comparison of 
% correct/incorrect predictions.
% For details of shift, see R9
figure(13); 
plot(x,signal,'b-',wx,wy,'g-');   
xlim([0 1050]);
grid on; 
%% 17   EXCEL: Order Type, Price, by Trade 
% Load results.m - produces results.xlsx
%results;
%% 18   EXCEL: For all Shift, MA, Profitability  
%R0tradingStrategyResultsAvgTesterR1;
%% 19   Sharpe Ratio
annualisedSharpe4a = sharpeCalc(tally3, interestFreeRate, dailyReturn, dailyReturnReturn,interestFreeRateDaily);
%% 20   Trading Perf Analysis Table for Commodity 
%Number of Trades
numberOfTrades=event_number-1
winningTrades=Combined_Accuracy 
totalPnL=overall_profit_or_loss     % based on unnormalised signal
totalPnLAsPercentage=((overall_profit_or_loss/data(1))*100)
sharpeRatio=annualisedSharpe4a
%% 21   Trading Perf Analysis Table for S&P Benchamrks
sp500BuyAndHold =(sp500Index(end)-sp500Index(1));
sp500BuyAndHoldAsPercentage=((sp500Index(end)-sp500Index(1))/sp500Index(1))*100;
%sp500BuyAndHoldSharpe=sharpeCalc(sp500BuyAndHold, interestFreeRate, dailyReturnSp500, dailyReturnReturnSp500,interestFreeRateDaily);
sp500BuyAndHoldSharpe=sharpe(dailyReturnReturnSp500,interestFreeRateDaily)*sqrt(252);
spGsciBuyAndHold = (spGsciIndex(end)-spGsciIndex(1));
spGsciBuyAndHoldAsPercentage = (spGsciIndex(end)-spGsciIndex(1))/spGsciIndex(1)*100;
%spGsciBuyAndHoldSharpe=sharpeCalc(spGsciBuyAndHold, interestFreeRate, dailyReturnSpGsci, dailyReturnReturnSpGsci,interestFreeRateDaily);
spGsciBuyAndHoldSharpe=sharpe(dailyReturnReturnGsci,interestFreeRateDaily)*sqrt(252);

save(signalName);
