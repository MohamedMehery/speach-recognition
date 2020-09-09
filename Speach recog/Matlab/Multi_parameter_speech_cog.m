%% this .m file extract the features of input voice 

clc;
close all;
input_pitch_freqindex_mtx = zeros(10 , 10);
input_pitch_timeindex_mtx = zeros(10 , 10);

input_pitch_freq_mtx =  zeros(10 , 10);
input_pitch_time_mtx =  zeros(10 , 10);

input_freq_max_value_mtx = zeros(10 , 10);
input_time_max_value = zeros(10 , 10);
lp = lowpass();
%% get record

% recObj = audiorecorder(24000,8,2);%streo recording two channels , 8-bits , 24000 sampls
% disp('Start speaking.')
% recordblocking(recObj, 2);
% disp('End of Recording.');
% pause(2);
% play(recObj);
% input_voice = getaudiodata(recObj);

%% extract the input voice features
[input_voice, fs] = audioread('seven.mp3');
input_voice = filter(lp,input_voice);
input_voice(fs,1) = 0;

sample_length = fs/10 ;  
input_voice_samples = zeros(sample_length , 10);
fft_input_samples = zeros(sample_length , 10);
f =( fs/2)*linspace(-1,1,fs); 
t = linspace(0,1 , fs);
for sample_nums = 0:9
    
    input_voice_samples(:,sample_nums+1) = input_voice((sample_nums * sample_length) + 1 : (sample_nums + 1 ) * sample_length );
    fft_input_samples ( :,sample_nums+1) = fft(input_voice_samples(:,sample_nums+1));
    fft_input_samples ( :,sample_nums+1) = fftshift(fft_input_samples(:,sample_nums+1));
   %extract the frequency parameters
    [input_freq_max_value_mtx(1,sample_nums + 1)  ,input_pitch_freqindex_mtx(1,sample_nums + 1)] = max(fft_input_samples(:,sample_nums+1));
    input_pitch_freq_mtx(1,sample_nums + 1) = f(input_pitch_freqindex_mtx(1,sample_nums + 1));
    %extract the time parameters
    [input_time_max_value(1,sample_nums + 1)  ,input_pitch_timeindex_mtx(1,sample_nums + 1)] = max(input_voice_samples(:,sample_nums+1));
    input_pitch_time_mtx(1,sample_nums + 1) = t(input_pitch_timeindex_mtx(1,sample_nums + 1));    
end

for rows = 2:10
    input_pitch_freq_mtx(rows,:) = input_pitch_freq_mtx(1,:);
    input_pitch_time_mtx(rows,:) = input_pitch_time_mtx(1,:);
    input_pitch_timeindex_mtx(rows,:) = input_pitch_timeindex_mtx(1,:);
    input_pitch_freqindex_mtx(rows,:) = input_pitch_freqindex_mtx(1,:);
end

%% calculate the least squared difference
input_pitch_freq_mtx = input_pitch_freq_mtx.*1;
input_pitch_time_mtx = input_pitch_time_mtx.*10000;
input_pitch_freq_mtx = input_pitch_freq_mtx.^2;
input_pitch_time_mtx = input_pitch_time_mtx.^2;
input_pitch_freqindex_mtx = input_pitch_freqindex_mtx.^2;
input_pitch_timeindex_mtx = input_pitch_timeindex_mtx.^2;

%get the absolute of squared_diff_mtx
squared_freq_diff_mtx = abs(pitch_freq_mtx - input_pitch_freq_mtx);
squared_time_diff_mtx = abs(pitch_time_mtx - input_pitch_time_mtx);

squared_freq_indx_diff_mtx = abs(pitch_freqindex_mtx - input_pitch_freqindex_mtx);
squared_time_indx_diff_mtx = abs(pitch_timeindex_mtx - input_pitch_timeindex_mtx);

%mean function get the mean of colmns not rows so we rotate
squared_time_diff_mtx = rot90(squared_time_diff_mtx);
squared_freq_diff_mtx = rot90(squared_freq_diff_mtx);
squared_time_indx_diff_mtx = rot90(squared_time_indx_diff_mtx);
squared_freq_indx_diff_mtx = rot90(squared_freq_indx_diff_mtx);

Freq_lsd = find(mean(squared_freq_diff_mtx(:,:)) == min(mean(squared_freq_diff_mtx(:,:)))) - 1;
Time_lsd = find(mean(squared_time_diff_mtx(:,:)) == min(mean(squared_time_diff_mtx(:,:)))) - 1;
Timeindx_lsd = find(mean(squared_time_indx_diff_mtx(:,:)) == min(mean(squared_time_indx_diff_mtx(:,:)))) - 1;
Freqindx_lsd = find(mean(squared_freq_indx_diff_mtx(:,:)) == min(mean(squared_freq_indx_diff_mtx(:,:)))) - 1;

display(Freq_lsd);
display(Time_lsd);
display(Freqindx_lsd);
display(Timeindx_lsd);
if( Timeindx_lsd == Freqindx_lsd && Time_lsd == Freq_lsd) 
    Number_is  = Freqindx_lsd;
    display('      successful test');
    display(Number_is  ); 

end
