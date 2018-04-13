%% 1. Econometric Analysis of HHGasoil returns series r
load('TradingPerfHHGasoil.mat')
HHGasoil_signal='HHGasoil';
HHGasoil_numberOfTrades=numberOfTrades;
HHGasoil_winningTrades=winningTrades;
HHGasoil_totalPnL=totalPnL;
HHGasoil_sharpeRatio=sharpeRatio;
tradingPerfHHGasoil = {HHGasoil_signal,HHGasoil_numberOfTrades,HHGasoil_winningTrades,HHGasoil_totalPnL,HHGasoil_sharpeRatio};

clear numberOfTrades winningTrades totalPnL sharpeRatio 

%% 2. Do the exact same analysis for DD Gasoil 
load('TradingPerfDDGasoil.mat')
DDGasoil_signal='DDGasoil';
DDGasoil_numberOfTrades=numberOfTrades;
DDGasoil_winningTrades=winningTrades;
DDGasoil_totalPnL=totalPnL;
DDGasoil_sharpeRatio=sharpeRatio;
tradingPerfDDGasoil = {DDGasoil_signal,DDGasoil_numberOfTrades,DDGasoil_winningTrades,DDGasoil_totalPnL,DDGasoil_sharpeRatio};

clear numberOfTrades winningTrades totalPnL sharpeRatio 

%% 3. Do the exact same analysis for DD Crude 
load('TradingPerfDDCrude.mat')
DDCrude_signal='DDCrude';
DDCrude_numberOfTrades=numberOfTrades;
DDCrude_winningTrades=winningTrades;
DDCrude_totalPnL=totalPnL;
DDCrude_sharpeRatio=sharpeRatio;
tradingPerfDDCrude = {DDCrude_signal,DDCrude_numberOfTrades,DDCrude_winningTrades,DDCrude_totalPnL,DDCrude_sharpeRatio};

clear numberOfTrades winningTrades totalPnL sharpeRatio 



