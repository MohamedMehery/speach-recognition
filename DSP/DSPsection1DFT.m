%% DFT
clc;
clear;
close all;
F = dftmtx(4);
F * F';
w = linspace(0,2*pi,200);
dtft = exp(-2*j*w).*(sin(5*w/2)./sin(w/2));
figure;
plot(w,abs(dtft));
grid on;
title('abs(dtft) vs w');
signal = [1 1 1 1 1 0 0 0 0 0];
dft1 = fft(signal);
omega_samples = 2 * pi / 10 * [0:9];
hold on;
stem(omega_samples,dft1,'r');
s = [ ones(1,5) zeros(1,195)];
dft2 = fft(s);
close ;
plot(w,abs(dft2));
ws = 2 * pi / 200 * [0:199];
stem(ws,abs(dft2),'r');
figure;
stem(abs(dft2),'r');
%-----------------------------%
%% FFT 










