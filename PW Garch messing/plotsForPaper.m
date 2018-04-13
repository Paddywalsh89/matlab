%% 0 . Intro
% This is where the graphs for the paper: Trading Signal Analysis
% will be produced, 

%% 1. Plot the Gaosil Time Series 
load ('TradingPerfDDGasoil.mat');
figure1 = figure;
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
plot(date,y,'Parent',subplot1);
ylim([0 1100]);
ylabel('Gasoil Open Price Oct 2010-2014');
box(subplot1,'on');
set(subplot1,'FontSize',16,'XMinorGrid','on','XTickLabelRotation',45,'YMinorGrid','on');
