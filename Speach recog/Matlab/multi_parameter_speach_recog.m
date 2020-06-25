%% Multi-parameter speach_cognit
%we must devide the voice into 10 sample and we will do the process on each sample at time

pitch_freqindex_mtx = zeros(10 , 10);
pitch_timeindex_mtx = zeros(10 , 10);

pitch_freq_mtx =  zeros(10 , 10);
pitch_time_mtx =  zeros(10 , 10);

freq_max_value_mtx = zeros(10 , 10);
time_max_value = zeros(10 , 10);

lp = lowpass();
[zero_voice, fs] = audioread('zero.mp3');
zero_voice = filter(lp,zero_voice);
sample_length = length(zero_voice) / 10 ;  
zero_voice_samples = zeros(sample_length , 10);
fft_zero_samples = zeros(sample_length , 10);
f = 4000*linspace(-1,1,2*fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    zero_voice_samples(:,sample_nums+1) = zero_voice(sample_nums * sample_length + 1 : (sample_nums + 1 ) * sample_length );
    fft_zero_samples ( :,sample_nums+1) = fft(zero_voice_samples(:,sample_nums+1));
    fft_zero_samples ( :,sample_nums+1) = fftshift(fft_zero_samples(:,sample_nums+1));
   %extract the frequency parameters
    [freq_max_value_mtx(1,sample_nums + 1)  ,pitch_freqindex_mtx(1,sample_nums + 1)] = max(fft_zero_samples(:,sample_nums+1));
    pitch_freq_mtx(1,sample_nums + 1) = f(pitch_freqindex_mtx(1,sample_nums + 1));
    %extract the time parameters
    [time_max_value(1,sample_nums + 1)  ,pitch_timeindex_mtx(1,sample_nums + 1)] = max(zero_voice_samples(:,sample_nums+1));
    pitch_time_mtx(1,sample_nums + 1) = t(pitch_timeindex_mtx(1,sample_nums + 1));

    
end