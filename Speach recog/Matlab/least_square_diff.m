close all;
clc;
clear all;
lp = lowpass();
%%  record one
[one_voice fs] = audioread('one.mp3');%streo recording two channels , 8-bits , 8000 sampls
one_voice = filter(lp,one_voice);
% disp('Say "one"')
% recordblocking(one_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(one_voice);
% y = getaudiodata(one_voice);
one_voice = filter(lp,one_voice);
%Take fourier transform
% rot90(y);
fftSignal = fft(one_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[one_pitch_value, one_pitch_index] = max(fftSignal);
one_pitch_value = sqrt(real(one_pitch_value)^2 + imag(one_pitch_value)^2);
one_pitch_index = f(one_pitch_index);

%% record two 

[two_voice fs] = audioread('two.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "two"')
% recordblocking(two_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(two_voice);
% y = getaudiodata(two_voice);
two_voice = filter(lp,two_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(two_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[two_pitch_value, two_pitch_index] = max(fftSignal);
two_pitch_value = sqrt(real(two_pitch_value)^2 + imag(two_pitch_value)^2);
two_pitch_index = f(two_pitch_index);

%% record three 

[three_voice fs] = audioread('three.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "three"')
% recordblocking(three_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(three_voice);
% y = getaudiodata(three_voice);
three_voice = filter(lp,three_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(three_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[three_pitch_value, three_pitch_index] = max(fftSignal);
three_pitch_value = sqrt(real(three_pitch_value)^2 + imag(three_pitch_value)^2);
three_pitch_index = f(three_pitch_index);

%% record four 

[four_voice fs] = audioread('four.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "four"')
% recordblocking(four_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(four_voice);
% y = getaudiodata(four_voice);
four_voice = filter(lp,four_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(four_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[four_pitch_value, four_pitch_index] = max(fftSignal);
four_pitch_value = sqrt(real(four_pitch_value)^2 + imag(four_pitch_value)^2);
four_pitch_index = f(four_pitch_index);
%% record five 

[five_voice fs] = audioread('five.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "five"')
% recordblocking(five_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(five_voice);
% y = getaudiodata(five_voice);
five_voice = filter(lp,five_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(five_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[five_pitch_value, five_pitch_index] = max(fftSignal);
five_pitch_value = sqrt(real(five_pitch_value)^2 + imag(five_pitch_value)^2);
five_pitch_index = f(five_pitch_index);

%% record six 

[six_voice fs] = audioread('six.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "six"')
% recordblocking(six_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(six_voice);
% y = getaudiodata(six_voice);
six_voice = filter(lp,six_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(six_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[six_pitch_value, six_pitch_index] = max(fftSignal);
six_pitch_value = sqrt(real(six_pitch_value)^2 + imag(six_pitch_value)^2);
six_pitch_index = f(six_pitch_index);

%% record seven 

[seven_voice fs] = audioread('seven.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "seven"')
% recordblocking(seven_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(seven_voice);
% y = getaudiodata(seven_voice);
seven_voice = filter(lp,seven_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(seven_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[seven_pitch_value, seven_pitch_index] = max(fftSignal);
seven_pitch_value = sqrt(real(seven_pitch_value)^2 + imag(seven_pitch_value)^2);
seven_pitch_index = f(seven_pitch_index);

%% record eight 

[eight_voice fs] = audioread('eight.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "eight"')
% recordblocking(eight_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(eight_voice);
% y = getaudiodata(eight_voice);
eight_voice = filter(lp,eight_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(eight_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[eight_pitch_value, eight_pitch_index] = max(fftSignal);
eight_pitch_value = sqrt(real(eight_pitch_value)^2 + imag(eight_pitch_value)^2);
eight_pitch_index = f(eight_pitch_index);

%% record nine 

[nine_voice fs] = audioread('nine.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "nine"')
% recordblocking(nine_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(nine_voice);
% y = getaudiodata(nine_voice);
nine_voice = filter(lp,nine_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(nine_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[nine_pitch_value, nine_pitch_index] = max(fftSignal);
nine_pitch_value = sqrt(real(nine_pitch_value)^2 + imag(nine_pitch_value)^2);
nine_pitch_index = f(nine_pitch_index);

%% record zero 

[zero_voice fs] = audioread('zero.mp3');%streo recording two channels , 8-bits , 8000 sampls
% disp('Say "zero"')
% recordblocking(zero_voice, 2);
% disp('End of Recording.');
% pause(2);
% play(zero_voice);
% y = getaudiodata(zero_voice);
zero_voice = filter(lp,zero_voice);
% %Take fourier transform
% rot90(y);
fftSignal = fft(zero_voice);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = 4000*linspace(-1,1,2*fs); % each frequency sample represent 0.25hz => 4k / 16
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
[zero_pitch_value, zero_pitch_index] = max(fftSignal);
zero_pitch_value = sqrt(real(zero_pitch_value)^2 + imag(zero_pitch_value)^2);
zero_pitch_index = f(zero_pitch_index);

%% arr of pitch values
pitch_values = [zero_pitch_value one_pitch_value two_pitch_value three_pitch_value four_pitch_value five_pitch_value six_pitch_value seven_pitch_value eight_pitch_value nine_pitch_value];
pitch_values = pitch_values.*100;
pitch_values = pitch_values.^2;

%% arr of pitch indexs
pitch_indexs = [zero_pitch_index one_pitch_index two_pitch_index three_pitch_index four_pitch_index five_pitch_index six_pitch_index seven_pitch_index eight_pitch_index nine_pitch_index];
pitch_indexs = pitch_indexs.*100;
pitch_indexs = pitch_indexs.^2;