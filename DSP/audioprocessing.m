%% audio processing
clc;close all;
[y,Fs] = audioread('ssss.m4a');
[sizeofy, nop]= size(y);

nois = randn(size(y));
y= y + 0.005.*nois;
f = Fs/2*linspace(-1,1,sizeofy);
whos y
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% play(recObj);
% y = recObj;


%HD = soundpassfilter();
f1 = take500hz();freqz(f1);
f2 = take1khz();freqz(f2);
f3 = take1500hz();freqz(f3);
f4 = take2khz();freqz(f4);
f5 = take2500hz();freqz(f5);
f6 = take3khz();freqz(f6);
f7 = take3500hz();freqz(f7);
f8 = take4khz();freqz(f8);

Y1 = filter(f1,y);
Y2 = filter(f2,y);
Y3 = filter(f3,y);
Y4 = filter(f4,y);
Y5 = filter(f5,y);
Y6 = filter(f6,y);
Y7 = filter(f7,y);
Y8 = filter(f8,y);
Y = Y1 + Y2 + Y3 + Y4 + Y5 + Y6 + Y7 + Y8;
subplot(2,1,1);plot(y);title('input signal');
subplot(2,1,2);plot(Y);title('ouput signal');
figure;
ffty = fftshift(fft(y));
fftY = fftshift(fft(Y));

subplot(2,1,1);plot(f,ffty);title('frequency domain input signal');
subplot(2,1,2);plot(f,fftY);title('frequency domain output signal');
disp('original + noise signal play');        
p1 = audioplayer(y, Fs);
play(p1, [1 (get(p1, 'SampleRate') * 8)]);
disp('ouput signal play');  
p2 = audioplayer(Y, Fs);
play(p2, [1 (get(p2, 'SampleRate') * 8)]);
        

 
