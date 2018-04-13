%% 0 . Intro
% This is where the graphs for the paper: Trading Signal Analysis
% will be produced, 

% %% 1. Plot the Gaosil & Crude Time Series 
 load ('GasoilOpen.mat');
 load ('s&p500Open.mat');
% figure1 = figure;
% subplot1 = subplot(2,1,1,'Parent',figure1);
% hold(subplot1,'on');
% yyaxis left
% plot(DDGasoil_mmdate,gasoil_data,'Parent',subplot1);
% ylim([600 1100]);
% ylabel('($)  ','Rotation',0);
% yyaxis right 
% plot(mmdateGasoil,sp500Gasoil);
% plot(mmdateGsciGasoil,sp500GsciGasoil);
% ylabel('    ($)','Rotation',0);
% box(subplot1,'on');
% set(subplot1,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Gasoil & S&P Indices Open Price: Oct 2010-2014');
% legend({'Gasoil','S&P 500','S&P GCSCI'},'Location','northeast','FontSize',10);
% 
 load ('crudeOpen.mat');
% 
% subplot2 = subplot(2,1,2,'Parent',figure1);
% hold(subplot2,'on');
% yyaxis left
% plot(DDCrude_mmdate,crude_data,'Parent',subplot2);
% ylim([10 120]);
% ylabel('($)  ','Rotation',0); 
% yyaxis right 
% plot(mmdateCrude,sp500Crude);
% plot(mmdateGsciCrude,sp500GsciCrude);
% ylabel('    ($)','Rotation',0); 
% box(subplot2,'on');
% set(subplot2,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Crude & S&P Indices Open Price: Mar 2012 - 2016');
% legend({'Crude','S&P 500','S&P GCSCI'},'Location','northeast','FontSize',10);

 %% 2. Add Trading Perf to normalised plot of the Gaosil & Crude Time Series 
% load('tradingData.mat');
% figure3 = figure;
% subplot3 = subplot(2,1,1,'Parent',figure3);
% hold(subplot3,'on');
% yyaxis left
% plot(DDGasoil_mmdate,DDGasoilSignal_Norm,'Parent',subplot3);
% ylim([0 1]);
% ylabel('($)  ','Rotation',0);
% yyaxis right 
% plot(mmdateGasoil,sp500Gasoil_Norm,'k');
% plot(mmdateGsciGasoil,sp500GsciGasoil_Norm);
% plot(DDGasoil_trade_dates,DDGasoil_PnL_Norm,'-m.', 'MarkerSize',10);
% ylabel('    ($)','Rotation',0);
% box(subplot3,'on');
% set(subplot3,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Alpha, Gasoil & S&P Indices Open Price: Oct 2010-2014');
% legend({'Gasoil','S&P 500','S&P GCSCI','Alpha PnL'},'Location','northeast','FontSize',10);
% 
% load ('crudeOpen.mat');
% 
% subplot4 = subplot(2,1,2,'Parent',figure3);
% hold(subplot4,'on');
% yyaxis left
% plot(DDCrude_mmdate,DDCrudeSignal_Norm,'Parent',subplot4);
% ylim([0 1]);
% ylabel('($)  ','Rotation',0); 
% yyaxis right 
% plot(mmdateCrude,sp500Crude_Norm,'k');
% plot(mmdateGsciCrude,sp500GsciCrude_Norm);
% plot(DDCrude_trade_dates,DDCrude_PnL_Norm,'-m.', 'MarkerSize',10);
% ylim([0 1]);
% ylabel('    ($)','Rotation',0); 
% box(subplot4,'on');
% set(subplot4,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Alpha, Crude & S&P Indices Open Price: Mar 2012 - 2016');
% legend({'Crude','S&P 500','S&P GCSCI','Alpha PnL'},'Location','northeast','FontSize',10);

 %% 3. Plot the Gaosil & Crude Returns Time Series 
%  load ('GasoilOpen.mat');
%  load ('s&p500Open.mat');
% figure5 = figure;
% subplot4 = subplot(2,2,1,'Parent',figure5);
% hold(subplot4,'on');
% plot(DDGasoil_mmdate,gasoil_data,'Parent',subplot4);
% ylim([600 1100]);
% ylabel('($)  ','Rotation',0); 
% box(subplot4,'on');
% set(subplot4,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Gasoil Open Price: Oct 2010-2014');
% legend({'Gasoil','S&P 500','S&P GCSCI'},'Location','southwest','FontSize',10);
% 
%  load ('crudeOpen.mat');
% 
% subplot5 = subplot(2,2,2,'Parent',figure5);
% hold(subplot5,'on');
% plot(DDCrude_mmdate,crude_data,'Parent',subplot5);
% ylim([10 120]);
% ylabel('($)  ','Rotation',0); 
% box(subplot5,'on');
% set(subplot5,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Crude Open Price: Mar 2012 - 2016');
% legend({'Crude','S&P 500','S&P GCSCI'},'Location','southwest','FontSize',10);
% 
% subplot6 = subplot(2,2,3,'Parent',figure5);
% hold(subplot6,'on');
% gasoilReturnDate = DDGasoil_mmdate(2:end);
% plot(gasoilReturnDate,gasoilReturns,'Parent',subplot6);
% ylim([-10 10]);
% ylabel('($)  ','Rotation',0); 
% box(subplot6,'on');
% set(subplot6,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Gasoil Returns Price: Oct 2010-2014');
% legend({'Gasoil','S&P 500','S&P GCSCI'},'Location','southwest','FontSize',10);
% 
% subplot7 = subplot(2,2,4,'Parent',figure5);
% hold(subplot7,'on');
% crudeReturnDate = DDCrude_mmdate(2:end);
% plot(crudeReturnDate,crudeReturns,'Parent',subplot7);
% ylim([-10 10]);
% ylabel('($)  ','Rotation',0); 
% box(subplot7,'on');
% set(subplot7,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
% title('Crude Open Price: Mar 2012 - 2016');
% legend({'Crude','S&P 500','S&P GCSCI'},'Location','southwest','FontSize',10);

%% 5. Autocorrelation of Gasoil & Crude Time Series
% figure6 = figure;
% subplot8 = subplot(2,2,1,'Parent',figure6);
% hold(subplot8,'on');
% autocorr(gasoilReturns); % input to ACF are just returns, and not innovations after simple linear regression of returns
% ylim([-0.5 0.5]);
% set(subplot8,'FontSize',14,'XMinorGrid','on');
% title('Gasoil: Autocorrelation of Returns Series');
% % ACF
% subplot9 = subplot(2,2,2,'Parent',figure6);
% hold(subplot9,'on');
% autocorr(crudeReturns); % input to ACF are just returns2, and not innovations after simple linear regression of returns
% ylim([-0.5 0.5]);
% set(subplot9,'FontSize',14,'XMinorGrid','on');
% title('Crude: Autocorrelation of Returns Series');
% hold off;

%% 6. Partial Autocorrelation of Gasoil & Crude Time Series
% subplot10 = subplot(2,2,3,'Parent',figure6);
% hold(subplot10,'on');
% parcorr(gasoilReturns); % input to ACF are just returns, and not innovations after simple linear regression of returns
% ylim([-0.5 0.5]);
% set(subplot10,'FontSize',14,'XMinorGrid','on');
% title('Gasoil: Partical Autocorrelation of Returns Series');
% % ACF
% subplot11 = subplot(2,2,4,'Parent',figure6);
% hold(subplot11,'on');
% parcorr(crudeReturns); % input to ACF are just returns2, and not innovations after simple linear regression of returns
% ylim([-0.5 0.5]);
% set(subplot11,'FontSize',14,'XMinorGrid','on');
% title('Crude: Partial Autocorrelation of Returns Series');
% hold off;

%% 7.  Ljung-Box test
% [hLBGasoil,pLBGasoil] = lbqtest(gasoilReturns,'Lags',[2,3])
% [hLBCrude,pLBCrude] = lbqtest(crudeReturns,'Lags',[2,14])

%% 8. Volatility Only Graphs
 load ('GasoilOpen.mat');
 load ('s&p500Open.mat');
 load ('TradingPerfDDGasoil.mat');
 
figure11 = figure;
subplot13 = subplot(2,1,1,'Parent',figure11);
grid on;
hold(subplot13,'on');
plot(x,r,'k');
xlim([0 1000]);
set(subplot13,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
title('Gasoil Returns Signal');
hold(subplot13,'on');
grid on;
subplot12 = subplot(2,1,2,'Parent',figure11);
hold(subplot13,'on');
%plot(y,stoch_sigma,'k',y,garch_sigma,'g');
plot(y,garch_sigma,'g');
xlim([0 1000]);
set(subplot12,'FontSize',14,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
title('Volatility based on Price Returns Signal');
legend({'Green =Garch'},'Location','northeast','FontSize',10)
