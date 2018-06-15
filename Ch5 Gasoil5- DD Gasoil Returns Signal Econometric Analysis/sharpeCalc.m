%% 1.   Calculate the Sharpe Ratio 
% Note - working with Annualised Daily Return - worth double checking that
% this is best option for my studies. 
function annualisedSharpe4a = sharpeCalc(tally3, interestFreeRate, dailyReturn, dailyReturnReturn,interestFreeRateDaily);
%% 2.   Calc Returns signal for Alpha signal
alphaLogReturns = double((log(tally3(3:end)./tally3(2:end-1)))*100); % tally(1)=0 so move fwd by 1
alphaReturns = double(((tally3(2:end)-tally3(1:end-1)))*100);        % tally(1)=0 so move fwd by 1                                % calc mean daily return
sizeAlphaLogReturns=1:length(alphaLogReturns);
sizeAlphaReturns=1:length(alphaReturns);

%% 2.5  Calc Log Daily Returns
for i=1:length(dailyReturn);
    if dailyReturn(i)==0;
        dailyReturn(i)=0;
    else
logDailyReturn(i)=log(dailyReturn(i));
    end
end

%% 3.   Normalise Returns signal for plot: 
alphaLogReturns_norm=(alphaLogReturns - min(alphaLogReturns))/(max(alphaLogReturns)-min(alphaLogReturns));
alphaReturns_norm=(alphaReturns - min(alphaReturns))/(max(alphaReturns)-min(alphaReturns));

%% 4.   Calc Sharpe for Returns signal
annualisedSharpe=sharpe(alphaLogReturns,interestFreeRate); % Where interest free rate (US Treasury 10 yr) on 18th March 2012=2.31%
annualisedSharpe2=sharpe(alphaReturns,interestFreeRate);
annualisedSharpe3=sharpe(dailyReturn,interestFreeRate)*sqrt(252);
annualisedSharpe4=sharpe(logDailyReturn,interestFreeRate)*sqrt(252);
nonAnnualisedSharpe4a=sharpe(dailyReturnReturn,interestFreeRateDaily)    % should match sharpe6
annualisedSharpe4a=sharpe(dailyReturnReturn,interestFreeRateDaily)*sqrt(252) % should match sharpe5
Sharpe5=((mean(dailyReturnReturn)-interestFreeRateDaily)/(std(dailyReturnReturn)))*sqrt(252);
Sharpe6=((mean(dailyReturnReturn)-interestFreeRateDaily)/(std(dailyReturnReturn)));


%% 5.   Plot Norm Log and non-Log alphaReturns
% figure(4); 
% plot(sizeAlphaLogReturns,alphaLogReturns_norm,'b-',sizeAlphaReturns,alphaReturns_norm,'g-');   
% grid on; 

%% 6.   Plot Daily Return Signal 
% figure(5); 
% count=1:length(dailyReturn);
% plot(count,dailyReturn);   
% grid on; 
%% 7.   Plot Daily Return Return Signal 
 figure(6); 
 count1=1:length(dailyReturnReturn);
 plot(count1,dailyReturnReturn);   
 grid on; 