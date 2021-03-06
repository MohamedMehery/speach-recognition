%% Multi-parameter speach_cognit
%we must devide the voice into 10 sample and we will do the process on each sample at time
%DTW -> dynamic time raping to solve silience  time
%% Initializations
clc;
clear all;
close all;

pitch_freqindex_mtx = zeros(10 , 10);
pitch_timeindex_mtx = zeros(10 , 10);

pitch_freq_mtx =  zeros(10 , 10);
pitch_time_mtx =  zeros(10 , 10);

freq_max_value_mtx = zeros(10 , 10);
time_max_value = zeros(10 , 10);

lp = lowpass();

%% extract the zero voice features
[zero_voice, fs] = audioread('zero.mp3');
zero_voice = filter(lp,zero_voice);
zero_voice(fs,1) = 0;
sample_length = fs/10 ;  
zero_voice_samples = zeros(sample_length , 10);
fft_zero_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    zero_voice_samples(:,sample_nums+1) = zero_voice((sample_nums * sample_length) + 1 : (sample_nums + 1 ) * sample_length );
    fft_zero_samples ( :,sample_nums+1) = fft(zero_voice_samples(:,sample_nums+1));
    fft_zero_samples ( :,sample_nums+1) = fftshift(fft_zero_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(1,sample_nums + 1)  ,pitch_freqindex_mtx(1,sample_nums + 1)] = max(fft_zero_samples(:,sample_nums+1));
    pitch_freq_mtx(1,sample_nums + 1) = f(pitch_freqindex_mtx(1,sample_nums + 1));
    %extract the time parameters
    [time_max_value(1,sample_nums + 1)  ,pitch_timeindex_mtx(1,sample_nums + 1)] = max(zero_voice_samples(:,sample_nums+1));
    pitch_time_mtx(1,sample_nums + 1) = t(pitch_timeindex_mtx(1,sample_nums + 1));    
end

%% extract the one voice features
[one_voice, fs] = audioread('one.mp3');
one_voice = filter(lp,one_voice);
one_voice(fs,1) = 0;
sample_length = fs/10 ;  
one_voice_samples = zeros(sample_length , 10);
fft_one_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    one_voice_samples(:,sample_nums+1) = one_voice((sample_nums * sample_length) + 1  : (sample_nums + 1 ) * sample_length );
    fft_one_samples ( :,sample_nums+1) = fft(one_voice_samples(:,sample_nums+1));
    fft_one_samples ( :,sample_nums+1) = fftshift(fft_one_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(2,sample_nums + 1)  ,pitch_freqindex_mtx(2,sample_nums + 1)] = max(fft_one_samples(:,sample_nums+1));
    pitch_freq_mtx(2,sample_nums + 1) = f(pitch_freqindex_mtx(2,sample_nums + 1));
    %extract the time parameters
    [time_max_value(2,sample_nums + 1)  ,pitch_timeindex_mtx(2,sample_nums + 1)] = max(one_voice_samples(:,sample_nums+1));
    pitch_time_mtx(2,sample_nums + 1) = t(pitch_timeindex_mtx(2,sample_nums + 1));    
end
%% extract the two voice features
[two_voice, fs] = audioread('two.mp3');
two_voice = filter(lp,two_voice);
two_voice(fs,1) = 0;
sample_length = fs/10 ;  
two_voice_samples = zeros(sample_length , 10);
fft_two_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    two_voice_samples(:,sample_nums+1) = two_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_two_samples ( :,sample_nums+1) = fft(two_voice_samples(:,sample_nums+1));
    fft_two_samples ( :,sample_nums+1) = fftshift(fft_two_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(3,sample_nums + 1)  ,pitch_freqindex_mtx(3,sample_nums + 1)] = max(fft_two_samples(:,sample_nums+1));
    pitch_freq_mtx(3,sample_nums + 1) = f(pitch_freqindex_mtx(3,sample_nums + 1));
    %extract the time parameters
    [time_max_value(3,sample_nums + 1)  ,pitch_timeindex_mtx(3,sample_nums + 1)] = max(two_voice_samples(:,sample_nums+1));
    pitch_time_mtx(3,sample_nums + 1) = t(pitch_timeindex_mtx(3,sample_nums + 1));    
end

%% extract the three voice features
[three_voice, fs] = audioread('three.mp3');
three_voice = filter(lp,three_voice);
three_voice(fs,1) = 0;

sample_length = fs/10 ;  
three_voice_samples = zeros(sample_length , 10);
fft_three_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    three_voice_samples(:,sample_nums+1) = three_voice((sample_nums * sample_length) + 1 : (sample_nums + 1 ) * sample_length );
    fft_three_samples ( :,sample_nums+1) = fft(three_voice_samples(:,sample_nums+1));
    fft_three_samples ( :,sample_nums+1) = fftshift(fft_three_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(4,sample_nums + 1)  ,pitch_freqindex_mtx(4,sample_nums + 1)] = max(fft_three_samples(:,sample_nums+1));
    pitch_freq_mtx(4,sample_nums + 1) = f(pitch_freqindex_mtx(4,sample_nums + 1));
    %extract the time parameters
    [time_max_value(4,sample_nums + 1)  ,pitch_timeindex_mtx(4,sample_nums + 1)] = max(three_voice_samples(:,sample_nums+1));
    pitch_time_mtx(4,sample_nums + 1) = t(pitch_timeindex_mtx(4,sample_nums + 1));    
end

%% extract the four voice features
[four_voice, fs] = audioread('four.mp3');
four_voice = filter(lp,four_voice);
four_voice(fs,1) = 0;

sample_length = fs/10 ;  
four_voice_samples = zeros(sample_length , 10);
fft_four_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    four_voice_samples(:,sample_nums+1) = four_voice((sample_nums * sample_length) + 1 : (sample_nums + 1 ) * sample_length );
    fft_four_samples ( :,sample_nums+1) = fft(four_voice_samples(:,sample_nums+1));
    fft_four_samples ( :,sample_nums+1) = fftshift(fft_four_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(5,sample_nums + 1)  ,pitch_freqindex_mtx(5,sample_nums + 1)] = max(fft_four_samples(:,sample_nums+1));
    pitch_freq_mtx(5,sample_nums + 1) = f(pitch_freqindex_mtx(5,sample_nums + 1));
    %extract the time parameters
    [time_max_value(5,sample_nums + 1)  ,pitch_timeindex_mtx(5,sample_nums + 1)] = max(four_voice_samples(:,sample_nums+1));
    pitch_time_mtx(5,sample_nums + 1) = t(pitch_timeindex_mtx(5,sample_nums + 1));    
end

%% extract the five voice features
[five_voice, fs] = audioread('five.mp3');
five_voice = filter(lp,five_voice);
five_voice(fs,1) = 0;

sample_length = fs/10 ;  
five_voice_samples = zeros(sample_length , 10);
fft_five_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    five_voice_samples(:,sample_nums+1) = five_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_five_samples ( :,sample_nums+1) = fft(five_voice_samples(:,sample_nums+1));
    fft_five_samples ( :,sample_nums+1) = fftshift(fft_five_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(6,sample_nums + 1)  ,pitch_freqindex_mtx(6,sample_nums + 1)] = max(fft_five_samples(:,sample_nums+1));
    pitch_freq_mtx(6,sample_nums + 1) = f(pitch_freqindex_mtx(6,sample_nums + 1));
    %extract the time parameters
    [time_max_value(6,sample_nums + 1)  ,pitch_timeindex_mtx(6,sample_nums + 1)] = max(five_voice_samples(:,sample_nums+1));
    pitch_time_mtx(6,sample_nums + 1) = t(pitch_timeindex_mtx(6,sample_nums + 1));    
end

%% extract the six voice features
[six_voice, fs] = audioread('six.mp3');
six_voice = filter(lp,six_voice);
six_voice(fs,1) = 0;

sample_length = fs/10 ;  
six_voice_samples = zeros(sample_length , 10);
fft_six_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    six_voice_samples(:,sample_nums+1) = six_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_six_samples ( :,sample_nums+1) = fft(six_voice_samples(:,sample_nums+1));
    fft_six_samples ( :,sample_nums+1) = fftshift(fft_six_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(7,sample_nums + 1)  ,pitch_freqindex_mtx(7,sample_nums + 1)] = max(fft_six_samples(:,sample_nums+1));
    pitch_freq_mtx(7,sample_nums + 1) = f(pitch_freqindex_mtx(7,sample_nums + 1));
    %extract the time parameters
    [time_max_value(7,sample_nums + 1)  ,pitch_timeindex_mtx(7,sample_nums + 1)] = max(six_voice_samples(:,sample_nums+1));
    pitch_time_mtx(7,sample_nums + 1) = t(pitch_timeindex_mtx(7,sample_nums + 1));    
end

%% extract the seven voice features
[seven_voice, fs] = audioread('seven.mp3');
seven_voice = filter(lp,seven_voice);
seven_voice(fs,1) = 0;

sample_length = fs/10 ;  
seven_voice_samples = zeros(sample_length , 10);
fft_seven_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    seven_voice_samples(:,sample_nums+1) = seven_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_seven_samples ( :,sample_nums+1) = fft(seven_voice_samples(:,sample_nums+1));
    fft_seven_samples ( :,sample_nums+1) = fftshift(fft_seven_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(8,sample_nums + 1)  ,pitch_freqindex_mtx(8,sample_nums + 1)] = max(fft_seven_samples(:,sample_nums+1));
    pitch_freq_mtx(8,sample_nums + 1) = f(pitch_freqindex_mtx(8,sample_nums + 1));
    %extract the time parameters
    [time_max_value(8,sample_nums + 1)  ,pitch_timeindex_mtx(8,sample_nums + 1)] = max(seven_voice_samples(:,sample_nums+1));
    pitch_time_mtx(8,sample_nums + 1) = t(pitch_timeindex_mtx(8,sample_nums + 1));    
end

%% extract the eight voice features
[eight_voice, fs] = audioread('eight.mp3');
eight_voice = filter(lp,eight_voice);
eight_voice(fs,1) = 0;

sample_length = fs/10 ;  
eight_voice_samples = zeros(sample_length , 10);
fft_eight_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    eight_voice_samples(:,sample_nums+1) = eight_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_eight_samples ( :,sample_nums+1) = fft(eight_voice_samples(:,sample_nums+1));
    fft_eight_samples ( :,sample_nums+1) = fftshift(fft_eight_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(9,sample_nums + 1)  ,pitch_freqindex_mtx(9,sample_nums + 1)] = max(fft_eight_samples(:,sample_nums+1));
    pitch_freq_mtx(9,sample_nums + 1) = f(pitch_freqindex_mtx(9,sample_nums + 1));
    %extract the time parameters
    [time_max_value(9,sample_nums + 1)  ,pitch_timeindex_mtx(9,sample_nums + 1)] = max(eight_voice_samples(:,sample_nums+1));
    pitch_time_mtx(9,sample_nums + 1) = t(pitch_timeindex_mtx(9,sample_nums + 1));    
end

%% extract the nine voice features
[nine_voice, fs] = audioread('nine.mp3');
nine_voice = filter(lp,nine_voice);
nine_voice(fs,1) = 0;

sample_length = fs/10 ;  
nine_voice_samples = zeros(sample_length , 10);
fft_nine_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    nine_voice_samples(:,sample_nums+1) = nine_voice((sample_nums * sample_length) + 1: (sample_nums + 1 ) * sample_length );
    fft_nine_samples ( :,sample_nums+1) = fft(nine_voice_samples(:,sample_nums+1));
    fft_nine_samples ( :,sample_nums+1) = fftshift(fft_nine_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(10,sample_nums + 1)  ,pitch_freqindex_mtx(10,sample_nums + 1)] = max(fft_nine_samples(:,sample_nums+1));
    pitch_freq_mtx(10,sample_nums + 1) = f(pitch_freqindex_mtx(10,sample_nums + 1));
    %extract the time parameters
    [time_max_value(10,sample_nums + 1)  ,pitch_timeindex_mtx(10,sample_nums + 1)] = max(nine_voice_samples(:,sample_nums+1));
    pitch_time_mtx(10,sample_nums + 1) = t(pitch_timeindex_mtx(10,sample_nums + 1));    
end

%% square the result

pitch_freq_mtx = pitch_freq_mtx.*1;
pitch_time_mtx = pitch_time_mtx.*10000;
pitch_freq_mtx = pitch_freq_mtx.^2;
pitch_time_mtx = pitch_time_mtx.^2;
pitch_timeindex_mtx  = pitch_timeindex_mtx .^2;
pitch_freqindex_mtx = pitch_freqindex_mtx.^2;

All_features = [pitch_freqindex_mtx , pitch_timeindex_mtx];
Output = zeros(10,10);
for i = 1 : 10
    for j = i
        Output(i , j) = 1;
    end
end
