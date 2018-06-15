clear tradingData.mat;
load('crudeOpen.mat');
load('gasoilOpen.mat');
load('s&p500Open.mat');
%% 1. Econometric Analysis of HHGasoil returns series r
load('TradingPerfHHGasoil.mat')
HHGasoil_signal='HHGasoil';
HHGasoil_numberOfTrades=numberOfTrades;
HHGasoil_winningTrades=winningTrades;
HHGasoil_totalPnL=totalPnL;
HHGasoil_totalPnLAsPercentage=totalPnLAsPercentage;
HHGasoil_sharpeRatio=sharpeRatio;
tradingPerfHHGasoil = {HHGasoil_signal,HHGasoil_numberOfTrades,HHGasoil_winningTrades,HHGasoil_totalPnL,HHGasoil_totalPnLAsPercentage,HHGasoil_sharpeRatio};

clear numberOfTrades winningTrades totalPnL sharpeRatio 

%% 1.5. Trading Analysis of HHGasoil returns series r
HHGasoil_trade_dates_as_number=wx;
% HHGasoil_trade_requires loop below
for i=1:size(wx);
    wx(i);
    HHGasoil_trade_dates=HHGasoil_mmdate(wx);
end
HHGasoil_PnL=tally3;
HHGasoil_PnL_Norm=tally3_norm;

clear wx tally3_norm tally3 signal_norm
%clear 'TradingPerfHHGasoil.mat'

%% 2. Do the exact same analysis for DD Gasoil 
load('TradingPerfDDGasoil.mat')
DDGasoil_signal='DDGasoil';
DDGasoil_numberOfTrades=numberOfTrades;
DDGasoil_winningTrades=winningTrades;
DDGasoil_totalPnL=totalPnL;
DDGasoil_totalPnLAsPercentage=totalPnLAsPercentage;
DDGasoil_sharpeRatio=sharpeRatio;
DDGasoil_sp500BuyHold= sp500BuyAndHold;
DDGasoil_sp500BuyHoldAsPercentage= sp500BuyAndHoldAsPercentage;
DDGasoil_sp500Sharpe= sp500BuyAndHoldSharpe;
DDGasoil_spGsciBuyHold= spGsciBuyAndHold;
DDGasoil_spGsciBuyHoldAsPercentage= spGsciBuyAndHoldAsPercentage;
DDGasoil_spGsciSharpe= spGsciBuyAndHoldSharpe;
tradingPerfDDGasoil = {DDGasoil_signal,DDGasoil_numberOfTrades,DDGasoil_winningTrades,DDGasoil_totalPnL,DDGasoil_totalPnLAsPercentage,DDGasoil_sharpeRatio};
tradingPerfDDGasoilSp = {'DDGasoilSp500',0,0,sp500BuyAndHold,sp500BuyAndHoldAsPercentage,sp500BuyAndHoldSharpe};
tradingPerfDDGasoilSpGsci = {'DDGasoilGsci',0,0,spGsciBuyAndHold,spGsciBuyAndHoldAsPercentage,spGsciBuyAndHoldSharpe};
clear numberOfTrades winningTrades totalPnL sharpeRatio

%% 2.5. Do the exact same analysis for DD Gasoil returns series r
DDGasoil_trade_dates_as_number=wx;
% DDGasoil_trade_requires loop below
for i=1:size(wx);
    wx(i);
    DDGasoil_trade_dates=DDGasoil_mmdate(wx);
end
for i=1:1:length(wx)
   DDGasoil_trade_price(i)=order_price(i);
    DDGasoil_trade_type(i)=order_type(i);
end
DDGasoil_PnL=tally3;
DDGasoil_PnL_Norm=tally3_norm;
tradingPerfOrderDetailsDDGasoil={wx, transpose(DDGasoil_trade_dates),DDGasoil_trade_type,DDGasoil_trade_price}



clear wx tally3_norm tally3 signal_norm
%clear 'TradingPerfDDGasoil.mat'

%% 3. Do the exact same analysis for DD Crude 
load('TradingPerfDDCrude.mat')
DDCrude_signal='DDCrude';
DDCrude_numberOfTrades=numberOfTrades;
DDCrude_winningTrades=winningTrades;
DDCrude_totalPnL=totalPnL;
DDCrude_totalPnLAsPercentage=totalPnLAsPercentage;
DDCrude_sharpeRatio=sharpeRatio;
DDCrude_sp500BuyHold = sp500BuyAndHold;
DDCrude_sp500BuyHoldAsPercentage = sp500BuyAndHoldAsPercentage;
DDCrude_sp500Sharpe= sp500BuyAndHoldSharpe;
DDCrude_spGsciBuyHold = spGsciBuyAndHold;
DDCrude_spGsciBuyHoldAsPercentage = spGsciBuyAndHoldAsPercentage;
DDCrude_spGsciSharpe= spGsciBuyAndHoldSharpe;
tradingPerfDDCrude = {DDCrude_signal,DDCrude_numberOfTrades,DDCrude_winningTrades,DDCrude_totalPnL,DDCrude_totalPnLAsPercentage,DDCrude_sharpeRatio};
tradingPerfDDCrudeSp = {'DDCrudeSp500',0,0,DDCrude_sp500BuyHold,DDCrude_sp500BuyHoldAsPercentage,DDCrude_sp500Sharpe};
tradingPerfDDCrudeSpGsci = {'DDCrudeGsci',0,0,DDCrude_spGsciBuyHold,DDCrude_spGsciBuyHoldAsPercentage,DDCrude_spGsciSharpe};

clear numberOfTrades winningTrades totalPnL sharpeRatio 
 
%% 3.5. Do the exact same analysis for DD Crude returns series r
DDCrude_trade_dates_as_number=wx;
% DDCrude_trade_requires loop below
for i=1:size(wx);
    wx(i);
    DDCrude_trade_dates=DDCrude_mmdate(wx);
end
for i=1:1:length(wx);
    DDCrude_trade_price(i)=order_price(i);
    DDCrude_trade_type(i)=order_type(i);
end
DDCrude_PnL=tally3;
DDCrude_PnL_Norm=tally3_norm;
tradingPerfOrderDetailsDDCrude={wx, transpose(DDCrude_trade_dates),DDCrude_trade_type,DDCrude_trade_price}

clear wx tally3_norm tally3 signal_norm
%clear 'TradingPerfDDCrude.mat'

%% 4. Save everything down
save ('tradingData');