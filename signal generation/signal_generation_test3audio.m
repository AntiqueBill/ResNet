%3类混合， 音调干扰90M+93M+95M，SIR为0到10dB，载频80到100MHZ， 采样频率40MHZ， 码元速率2M，FSK频间隔1MHZ，训练集每个1000个，测试集每个500个， 0dB到15dB
close all;
clear all;
clc;
tic

fc=8e7;%
fs=4e8;%
fd=2e6;%
freqsep=1e6;
Ac=1;
N_code=15;%
N_sample= 500;
N_sample_test=500;
N_train=500;
N_fe=27;

%
f0=9e7;
f1=9.3e7;
f2=9.5e7;    
audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%
%
% fc_pluse = 9e7;
% pulse = jam_pulse(1 , fs,  fc_pluse, N_code*fs/fd);
% %
% zaidai = jam_zaidai(1, N_code*fs/fd, 1);
% %
% lfm = LFM(N_code,fs,fd,Ac);

begin_sir=0;
end_sir=10;
kindnum_code=2;
num_code=4;
mode1= zeros(N_sample,N_code*fs/fd+1);
mode2= zeros(N_sample,N_code*fs/fd+1);
mode3= zeros(N_sample,N_code*fs/fd+1);
mode4= zeros(N_sample,N_code*fs/fd+1);
mode5= zeros(N_sample,N_code*fs/fd+1);
mode6= zeros(N_sample,N_code*fs/fd+1);
mode7= zeros(N_sample,N_code*fs/fd+1);

mode_audio1= zeros(N_sample,N_code*fs/fd+1);
mode_audio2= zeros(N_sample,N_code*fs/fd+1);
mode_audio3= zeros(N_sample,N_code*fs/fd+1);
mode_audio4= zeros(N_sample,N_code*fs/fd+1);
mode_audio5= zeros(N_sample,N_code*fs/fd+1);
mode_audio6= zeros(N_sample,N_code*fs/fd+1);
mode_audio7= zeros(N_sample,N_code*fs/fd+1);

for sir = begin_sir: end_sir
for num_sample=1:N_sample    
    fprintf('current sir=%d,',sir);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,fc1,fs,fd,freqsep,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode1(num_sample,:)=[1,y];   
    mode_audio1(num_sample,:)=[1,yr];
    
    fc2 = (8+2*rand(1))*1e7;
    y=psk2(N_code,fc2,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode2(num_sample,:)=[2,y];  
    mode_audio2(num_sample,:)=[2,yr];
    
    fc3 = (8+2*rand(1))*1e7;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode3(num_sample,:)=[3,y];  
    mode_audio3(num_sample,:)=[3,yr];

    fc4 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode4(num_sample,:)=[4,y];
    mode_audio4(num_sample,:)=[4,yr];
    
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode5(num_sample,:)=[5,y];    
    mode_audio5(num_sample,:)=[5,yr];
      
    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode6(num_sample,:)=[6,y];     
    mode_audio6(num_sample,:)=[6,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%脙禄脫脨录脫脠毛脛脺脕驴
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    audio_inf = audio_inf * (sqrt(sum(y.^2)) / 10^(sir/10));
    y=awgn(y,10,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode7(num_sample,:)=[7,y];   
    mode_audio7(num_sample,:)=[7,yr];
end

if sir <0
    fdata = strcat('test_audio','_',num2str(abs(sir)));
else
    fdata = strcat('test_audio', num2str(sir));
end

test_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end)];

test_x_audio=[mode_audio1(1:N_train,2:end);mode_audio2(1:N_train,2:end);mode_audio3(1:N_train,2:end);mode_audio4(1:N_train,2:end);mode_audio5(1:N_train,2:end);...
    mode_audio6(1:N_train,2:end);mode_audio7(1:N_train,2:end)];
% test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
%     mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
%     mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);...
%     mode16(N_train+1:end,2:end);mode17(N_train+1:end,2:end);mode18(N_train+1:end,2:end);mode19(N_train+1:end,2:end);mode20(N_train+1:end,2:end);...
%     mode21(N_train+1:end,2:end);mode22(N_train+1:end,2:end);mode23(N_train+1:end,2:end);mode24(N_train+1:end,2:end);mode25(N_train+1:end,2:end);...
%     mode26(N_train+1:end,2:end);mode27(N_train+1:end,2:end);mode28(N_train+1:end,2:end);mode29(N_train+1:end,2:end);mode30(N_train+1:end,2:end);mode31(N_train+1:end,2:end)];

test_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1)];

%test_y_audio和test_y是同一个
% test_y_audio=[mode_audio1(1:N_train,1);mode_audio2(1:N_train,1);mode_audio3(1:N_train,1);mode_audio4(1:N_train,1);mode_audio5(1:N_train,1);...
%     mode_audio6(1:N_train,1);mode_audio7(1:N_train,1);mode_audio8(1:N_train,1);mode_audio9(1:N_train,1);mode_audio10(1:N_train,1);...
%     mode_audio11(1:N_train,1);mode_audio12(1:N_train,1);mode_audio13(1:N_train,1);mode_audio14(1:N_train,1);mode_audio15(1:N_train,1);...
%     mode_audio16(1:N_train,1);mode_audio17(1:N_train,1);mode_audio18(1:N_train,1);mode_audio19(1:N_train,1);mode_audio20(1:N_train,1);...
%     mode_audio21(1:N_train,1);mode_audio22(1:N_train,1);mode_audio23(1:N_train,1);mode_audio24(1:N_train,1);mode_audio25(1:N_train,1);...
%     mode_audio26(1:N_train,1);mode_audio27(1:N_train,1);mode_audio28(1:N_train,1);mode_audio29(1:N_train,1);mode_audio30(1:N_train,1);mode_audio31(1:N_train,1)];

% test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
%     mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
%     mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1);...
%     mode16(N_train+1:end,1);mode17(N_train+1:end,1);mode18(N_train+1:end,1);mode19(N_train+1:end,1);mode20(N_train+1:end,1);...
%     mode21(N_train+1:end,1);mode22(N_train+1:end,1);mode23(N_train+1:end,1);mode24(N_train+1:end,1);mode25(N_train+1:end,1);...
%     mode26(N_train+1:end,1);mode27(N_train+1:end,1);mode28(N_train+1:end,1);mode29(N_train+1:end,1);mode30(N_train+1:end,1);mode31(N_train+1:end,1)];


disp(strcat('saving',32, fdata,'_audio.mat...'))
save(strcat('../data/audio/',fdata),'test_x','test_x_audio', 'test_y','-v7.3')

clear test_x  test_x_audio test_y
end

toc
