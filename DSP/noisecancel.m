%% noise cancel 
close all;clc;
lp = lowpass();freqz(lp);
n = linspace(0,5,1000); 
signal =0.0 * rand(1,1000) + sin(2 * pi * 1000 * n) +  sin(2 * pi * 15000 * n);
 fsignal = filter(lp,signal);

 figure;
 subplot(2,1,1);plot(signal);title('input signal');grid on;
 subplot(2,1,2);plot(fsignal);title('output signal'); grid on;

 %% HPF
 hp = hpfilter();freqz(hp);
  fsignal = filter(hp,signal);
  figure;
 subplot(2,1,1);plot(signal);title('high pass input signal');grid on;
 subplot(2,1,2);plot(fsignal);title('high pass output signal'); grid on;