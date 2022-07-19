close all
clearvars
clc

% leitura dos audios e definindo fc, fs, wc e wn
[y1, fs1] = audioread('7mono.wav');
[y2, fs2] = audioread('13mono.wav');
[y3, fs3] = audioread('17mono.wav');
[y4, fs4] = audioread('24mono.wav');
[y5, fs5] = audioread('31mono.wav');
[y6, fs6] = audioread('49mono.wav');
fc1 = 6800;
wc1 = pi*fc1/(fs1/2);
wn1 = fc1/(fs1/2);
fc2 = 6050;
wc2 = pi*fc2/(fs2/2);
wn2 = fc2/(fs2/2);
fc3 = 4600;
wc3 = pi*fc3/(fs3/2);
wn3 = fc3/(fs3/2);
fc4 = 4200;
wc4 = pi*fc4/(fs4/2);
wn4 = fc4/(fs4/2);
fc5 = 4100;
wc5 = pi*fc5/(fs5/2);
wn5 = fc5/(fs5/2);
fc6 = 4000;
wc6 = pi*fc6/(fs6/2);
wn6 = fc6/(fs6/2);
% usando segmento finito da resposta ao impulso: janela kaiser
M = 101;
nw = 0:M-1;
beta = 0.1102*(80 - 8.7);
hw1 = fir1(100, wn1, 'low', kaiser(M, beta));
[HW1,f1] = freqz(hw1,1,500,fs1);
hw2 = fir1(100, wn2, 'low', kaiser(M, beta));
[HW2,f2] = freqz(hw2,1,500,fs2);
hw3 = fir1(100, wn3, 'low', kaiser(M, beta));
[HW3,f3] = freqz(hw3,1,500,fs3);
hw4 = fir1(100, wn4, 'low', kaiser(M, beta));
[HW4,f4] = freqz(hw4,1,500,fs4);
hw5 = fir1(100, wn5, 'low', kaiser(M, beta));
[HW5,f5] = freqz(hw5,1,500,fs5);
hw6 = fir1(100, wn6, 'low', kaiser(M, beta));
[HW6,f6] = freqz(hw6,1,500,fs6);
% filtrando os audios
y1_filtrado = filter(hw1, 1, y1);
y2_filtrado = filter(hw2, 1, y2);
y3_filtrado = filter(hw3, 1, y3);
y4_filtrado = filter(hw4, 1, y4);
y5_filtrado = filter(hw5, 1, y5);
y6_filtrado = filter(hw6, 1, y6);
% escrita dos audios filtrados
audiowrite('7mono_filtrado.wav', y1_filtrado, fs1);
audiowrite('13mono_filtrado.wav', y2_filtrado, fs2);
audiowrite('17mono_filtrado.wav', y3_filtrado, fs3);
audiowrite('24mono_filtrado.wav', y4_filtrado, fs4);
audiowrite('31mono_filtrado.wav', y5_filtrado, fs5);
audiowrite('49mono_filtrado.wav', y6_filtrado, fs6);
% plot do primeiro filtro para visualização
figure('Position',[100 100 1200 300],'color','w');
subplot(1,3,1);
stem(nw,hw1,'Marker','.');
box on
title('Windowed Impulse response h');
xlabel('Samples');
ylabel('Amplitude');
subplot(1,3,2);
plot(f1,abs(HW1));
title('Frequency response H');
xlabel('frequency (Hz)');
ylabel('Magnitude Linear');
subplot(1,3,3);
H1dB = 20*log10(abs(HW1));
plot(f1,H1dB);
title('Frequency response H');
xlabel('frequency (Hz)');
ylabel('Magnitude dB');
% Plotando os sinais de audio no dominio tempo
% Audio 7 anos
NSamples1 = length(y1);
t1 = (0:NSamples1-1)/fs1;
figure('Position', [100 100 900 600], 'color', 'w');
ax1 = subplot(6,1,1);
hold on
plot(t1, y1);
plot(t1, y1_filtrado)
title('Time signal','Interpreter','latex') ;
ylabel('amplitude');
% Audio 13 anos
NSamples2 = length(y2);
t2 = (0:NSamples2-1)/fs2;
ax1 = subplot(6,1,2);
hold on
plot(t2, y2);
plot(t2, y2_filtrado)
ylabel('amplitude');
% Audio 17 anos
NSamples3 = length(y3);
t3 = (0:NSamples3-1)/fs3;
ax1 = subplot(6,1,3);
hold on
plot(t3, y3);
plot(t3, y3_filtrado)
ylabel('amplitude');
% Audio 24 anos
NSamples4 = length(y4);
t4 = (0:NSamples4-1)/fs4;
ax1 = subplot(6,1,4);
hold on
plot(t4, y4);
plot(t4, y4_filtrado)
ylabel('amplitude');
% Audio 31 anos
NSamples5 = length(y5);
t5 = (0:NSamples5-1)/fs5;
ax1 = subplot(6,1,5);
hold on
plot(t5, y5);
plot(t5, y5_filtrado)
ylabel('amplitude');
% Audio 49 anos
NSamples6 = length(y6);
t6 = (0:NSamples6-1)/fs6;
ax1 = subplot(6,1,6);
hold on
plot(t6, y6);
plot(t6, y6_filtrado)
xlabel('tempo (s)');
ylabel('amplitude');
