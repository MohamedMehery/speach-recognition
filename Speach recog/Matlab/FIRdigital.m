%% DSP using Matlab 12
%%FIR Non-recursive -> no y[n] independent of it self (no feedback)
%%Moving Average FIR filter 
close all;clear;
clc;
omega = -4*pi : 0.1 : 4*pi;
H = (1 + 2 * cos(omega)) / 3 ;  %% Laplace transfom of filter in time domain
plot(omega,H);  %% the filter consist of number of shifted x[n]
axis tight;
plot(omega/pi,abs(H));grid on;axis tight;
figure;
plot(omega/pi,angle(H)/pi);grid on;axis tight; %% plot the phase
%% better FIR filter more samples
omega = 0 : 0.01 : 1*pi;
M = 16;
N = 16;
H = (1/((N+M+1))*(exp(1i*omega*(N-M)/2)).*((sin(omega*(N+M+1)/2)./sin(omega/2))));
plot(omega,H);
axis equal;figure;
plot(omega , log10(H)*20,'r');
M = 32;N = 32;
H = (1/((N+M+1))*(exp(1i*omega*(N-M)/2)).*((sin(omega*(N+M+1)/2)./sin(omega/2))));
hold on;
plot(omega , log10(H)*20,'b');
xlabel('Omega');ylabel('dB');
n = -500:500;
h = 2/33 * sinc(2*n/33);
idx = find(abs(n)>32);
h(idx) = 0;
H = fftshift(fft(h));
omega = linspace(-pi,pi,1001);
%figure; %% adjust weight for each average 
hold on;
plot(omega,20*log10(abs(H)),'g');
axis tight;grid on;
xlim([-pi/2,pi/2]);
box on;
figure;
stem(n,h); %% plot the system in time domain
xlim([-50,50]);

close all;