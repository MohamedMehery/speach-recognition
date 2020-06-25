close all;
clc;
lp = lowpass();

recObj = audiorecorder(8000,8,1);%streo recording two channels , 8-bits , 8000 sampls
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');
pause(2);
play(recObj);
y = getaudiodata(recObj);
y = filter(lp,y);
% t = 0:1/48000:5-1/48000;
%Plot to illustrate that it is a sine wave
plot(y);
title('Time-Domain signal');
%Take fourier transform
% rot90(y);
fftSignal = fft(y);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*8000); % each frequency sample represent 0.25hz => 4k / 16

%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f,fftSignal); grid on;
title(' FFT of sound');
xlabel('Frequency (Hz)');
ylabel('magnitude');


[max_value, max_index] = max(fftSignal);
max_value = sqrt(real(max_value)^2 + imag(max_value)^2)
max_index = f(max_index)
