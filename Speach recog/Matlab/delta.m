%% delta function in time %%
close all;
clear;
clc;
n = -4 : 4 ;
delta_n = [0,0,0,0,1,0,0,0,0];
stem(n,delta_n);
xlabel('time');
ylabel('amp');
title('delta');
grid ON;
%% delta function 2nd method %%
n = -100 : 100;
delta_n = [zeros(1,100) 1 zeros(1,100)];
figure;
plot(n,delta_n);
xlabel('time');
ylabel('amp');
title('delta');
axis([-250,250,-2,2]);

grid ON;
%% delta impulse 3rd method
n = -20 : 20;
delta_n =n==0;
figure;
stem(n,delta_n);
xlabel('time');
ylabel('amp');
title('delta impulse');
axis([-25,25,-5,5]);
grid ON;
%% unit step function
n = -20 :0.1: 20;
delta_n =n>=0;
figure;
plot(n,delta_n);
xlabel('time');
ylabel('amp');
title('unit step function');
axis([-25,25,-5,5]);
grid ON;

%% sinc function
t = -10 : 0.0001 : 10;
a = sin(t) ./ t ;
figure;
plot(t,a);
xlabel('time');
ylabel('amp');
title('sinc function');
axis([-12,12,-3,3]);
grid ON;
close all;
%% sin wave
t = -10 :0.1: 10;
a = sin( 2 * pi * t * 0.1 - pi/2);   %% it becomes cosine
figure;
stem(t,a);
xlabel('time');
ylabel('amp');
title('sin function with shift 90?');
%axis([-12,12,-3,3]);
grid ON;
close all;
%% 