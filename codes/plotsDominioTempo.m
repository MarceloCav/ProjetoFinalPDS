close all
clearvars
clc

% leitura dos audios
[y1, fs1] = audioread('7mono.wav');
[y2, fs2] = audioread('13mono.wav');
[y3, fs3] = audioread('17mono.wav');
[y4, fs4] = audioread('24mono.wav');
[y5, fs5] = audioread('31mono.wav');
[y6, fs6] = audioread('49mono.wav')

% Plotando os sinais de audio no dominio tempo
% Audio 7 anos
NSamples1 = length(y1);
t1 = (0:NSamples1-1)/fs1;
figure('Position', [100 100 900 600], 'color', 'w');
ax1 = subplot(6,1,1);
plot(t1, y1);
title('Time signal','Interpreter','latex') ;
ylabel('amplitude');
% Audio 13 anos
NSamples2 = length(y2);
t2 = (0:NSamples2-1)/fs2;
ax1 = subplot(6,1,2);
plot(t2, y2);
ylabel('amplitude');
% Audio 17 anos
NSamples3 = length(y3);
t3 = (0:NSamples3-1)/fs3;
ax1 = subplot(6,1,3);
plot(t3, y3);
ylabel('amplitude');
% Audio 24 anos
NSamples4 = length(y4);
t4 = (0:NSamples4-1)/fs4;
ax1 = subplot(6,1,4);
plot(t4, y4);
ylabel('amplitude');
% Audio 31 anos
NSamples5 = length(y5);
t5 = (0:NSamples5-1)/fs5;
ax1 = subplot(6,1,5);
plot(t5, y5);
ylabel('amplitude');
% Audio 49 anos
NSamples6 = length(y6);
t6 = (0:NSamples6-1)/fs6;
ax1 = subplot(6,1,6);
plot(t6, y6);
xlabel('tempo (s)');
ylabel('amplitude');

