addpath('C:\Users\Walsh_pad\Dropbox\Further Study\Thesis\myfiles\Ch5')
addpath('C:\Users\Walsh_pad\Dropbox (Personal)\Further Study\Thesis\myfiles\AppendixB\Chapter 5 - Experiment 1 - Optimisation_Gasoil_Daily_Charts\Profit Vs Time Graph')
filename = 'For Chart';
sheet1 = 6; 
sp500Crude = 'C2:C1008';
x6 = size(SP500Crude);
SP500Crude=xlsread(filename, sheet1, sp500Crude);
sheet1 = 5; 
sp500Gasoil = 'C2:C1007';
x5 = size(sp500Gasoil);
sp500Gasoil=xlsread(filename, sheet1, sp500Gasoil);
sheet1 = 4; 
Crude = 'C3:C1100';
x4 = size(Crude);
Crude=xlsread(filename, sheet1, Crude);
sheet1 = 3; 
Gasoil = 'C2:943';
x3 = size(Gasoil);
Gasoil=xlsread(filename, sheet1, Gasoil);
sheet1 = 2; 
alphaCrude = 'CF2:F27';
x2 = size(alphaCrude);
alphaCrude=xlsread(filename, sheet1, alphaCrude);
sheet1=1;
alphaGasoil = 'F2:F28';
x1 = size(alphaGasoil);
alphaGasoil=xlsread(filename, sheet1, alphaGasoil);

figure(1)
plot(x6,SP500Crude,x6,
legend('blue = Price Signal','red = Levy Index','Location','southwest')
grid on;

figure(2)

