%��Ƶ80��100MHZ�� ����Ƶ��40MHZ�� ��Ԫ����2M��FSKƵ���1MHZ��ѵ����ÿ��1000�������Լ�ÿ��500���� 0dB��15dB
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
fc_pluse = 9e7;
pulse = jam_pulse(1 , fs,  fc_pluse, N_code*fs/fd);
%
zaidai = jam_zaidai(1, N_code*fs/fd, 1);
%
lfm = LFM(N_code,fs,fd,Ac);

begin_snr=0;
end_snr=15;
kindnum_code=2;
num_code=4;
mode1= zeros(N_sample,N_code*fs/fd+1);
mode2= zeros(N_sample,N_code*fs/fd+1);
mode3= zeros(N_sample,N_code*fs/fd+1);
mode4= zeros(N_sample,N_code*fs/fd+1);
mode5= zeros(N_sample,N_code*fs/fd+1);
mode6= zeros(N_sample,N_code*fs/fd+1);
mode7= zeros(N_sample,N_code*fs/fd+1);
mode8= zeros(N_sample,N_code*fs/fd+1);
mode9= zeros(N_sample,N_code*fs/fd+1);
mode10=zeros(N_sample,N_code*fs/fd+1);
mode11=zeros(N_sample,N_code*fs/fd+1);
mode12=zeros(N_sample,N_code*fs/fd+1);
mode13=zeros(N_sample,N_code*fs/fd+1);
mode14=zeros(N_sample,N_code*fs/fd+1);
mode15=zeros(N_sample,N_code*fs/fd+1);
mode16=zeros(N_sample,N_code*fs/fd+1);
mode17=zeros(N_sample,N_code*fs/fd+1);
mode18=zeros(N_sample,N_code*fs/fd+1);
mode19=zeros(N_sample,N_code*fs/fd+1);
mode20=zeros(N_sample,N_code*fs/fd+1);
mode21=zeros(N_sample,N_code*fs/fd+1);
mode22=zeros(N_sample,N_code*fs/fd+1);
mode23=zeros(N_sample,N_code*fs/fd+1);
mode24=zeros(N_sample,N_code*fs/fd+1);
mode25=zeros(N_sample,N_code*fs/fd+1);
mode26=zeros(N_sample,N_code*fs/fd+1);
mode27=zeros(N_sample,N_code*fs/fd+1);
mode28=zeros(N_sample,N_code*fs/fd+1);
mode29=zeros(N_sample,N_code*fs/fd+1);
mode30=zeros(N_sample,N_code*fs/fd+1);
mode31=zeros(N_sample,N_code*fs/fd+1);
mode_audio1= zeros(N_sample,N_code*fs/fd+1);
mode_audio2= zeros(N_sample,N_code*fs/fd+1);
mode_audio3= zeros(N_sample,N_code*fs/fd+1);
mode_audio4= zeros(N_sample,N_code*fs/fd+1);
mode_audio5= zeros(N_sample,N_code*fs/fd+1);
mode_audio6= zeros(N_sample,N_code*fs/fd+1);
mode_audio7= zeros(N_sample,N_code*fs/fd+1);
mode_audio8= zeros(N_sample,N_code*fs/fd+1);
mode_audio9= zeros(N_sample,N_code*fs/fd+1);
mode_audio10=zeros(N_sample,N_code*fs/fd+1);
mode_audio11=zeros(N_sample,N_code*fs/fd+1);
mode_audio12=zeros(N_sample,N_code*fs/fd+1);
mode_audio13=zeros(N_sample,N_code*fs/fd+1);
mode_audio14=zeros(N_sample,N_code*fs/fd+1);
mode_audio15=zeros(N_sample,N_code*fs/fd+1);
mode_audio16=zeros(N_sample,N_code*fs/fd+1);
mode_audio17=zeros(N_sample,N_code*fs/fd+1);
mode_audio18=zeros(N_sample,N_code*fs/fd+1);
mode_audio19=zeros(N_sample,N_code*fs/fd+1);
mode_audio20=zeros(N_sample,N_code*fs/fd+1);
mode_audio21=zeros(N_sample,N_code*fs/fd+1);
mode_audio22=zeros(N_sample,N_code*fs/fd+1);
mode_audio23=zeros(N_sample,N_code*fs/fd+1);
mode_audio24=zeros(N_sample,N_code*fs/fd+1);
mode_audio25=zeros(N_sample,N_code*fs/fd+1);
mode_audio26=zeros(N_sample,N_code*fs/fd+1);
mode_audio27=zeros(N_sample,N_code*fs/fd+1);
mode_audio28=zeros(N_sample,N_code*fs/fd+1);
mode_audio29=zeros(N_sample,N_code*fs/fd+1);
mode_audio30=zeros(N_sample,N_code*fs/fd+1);
mode_audio31=zeros(N_sample,N_code*fs/fd+1);


for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (8+2*rand(1))*1e7;
    y=ask2(N_code,fc1,fs,fd,Ac);
    %ÐÅºÅÄÜÁ¿¹éÒ»»¯
    y=y/sqrt(sum(y.^2));
    %¶àÒô¸ÉÈÅ
    
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    %Âö³å¸ÉÈÅ
%     fc_pluse = 9e7;
%     pulse = jam_pulse(1 , fs,  fc_pluse, N_code*fs/fd);
%     pulse = pulse/sqrt(sum(pulse.^2));
%     %Õ­´ø¸ÉÈÅ
%     zaidai = jam_zaidai(1, N_code*fs/fd, 1);
%     zaidai = zaidai/sqrt(sum(zaidai.^2));
%     %É¨Æµ¸ÉÈÅ
%     lfm = LFM(N_code,fs,fd,Ac);
%     lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode1(num_sample,:)=[1,y];   
    mode_audio1(num_sample,:)=[1,yr];
    
    fc2 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,fc2,fs,fd,freqsep,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode2(num_sample,:)=[2,y];  
    mode_audio2(num_sample,:)=[2,yr];
    
    fc3 = (8+2*rand(1))*1e7;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode3(num_sample,:)=[3,y];  
    mode_audio3(num_sample,:)=[3,yr];

    fc4 = (8+2*rand(1))*1e7;
    y=qam16(N_code,fc4,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode4(num_sample,:)=[4,y];
    mode_audio4(num_sample,:)=[4,yr];
    
    fc5 = (8+2*rand(1))*1e7;
    y=qam64(N_code,fc5,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode5(num_sample,:)=[5,y];    
    mode_audio5(num_sample,:)=[5,yr];
      
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode6(num_sample,:)=[6,y];     
    mode_audio6(num_sample,:)=[6,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode7(num_sample,:)=[7,y];   
    mode_audio7(num_sample,:)=[7,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode8(num_sample,:)=[8,y];
    mode_audio8(num_sample,:)=[8,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode9(num_sample,:)=[9,y]; 
    mode_audio9(num_sample,:)=[9,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode10(num_sample,:)=[10,y];   
    mode_audio10(num_sample,:)=[10,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode11(num_sample,:)=[11,y];  
    mode_audio11(num_sample,:)=[11,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode12(num_sample,:)=[12,y];
    mode_audio12(num_sample,:)=[12,yr];

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode13(num_sample,:)=[13,y]; 
    mode_audio13(num_sample,:)=[13,yr];

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode14(num_sample,:)=[14,y]; 
    mode_audio14(num_sample,:)=[14,yr];
    
    y=qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode15(num_sample,:)=[15,y]; 
    mode_audio15(num_sample,:)=[15,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode16(num_sample,:)=[16,y]; 
    mode_audio16(num_sample,:)=[16,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode17(num_sample,:)=[17,y];   
    mode_audio17(num_sample,:)=[17,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode18(num_sample,:)=[18,y]; 
    mode_audio18(num_sample,:)=[18,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode19(num_sample,:)=[19,y]; 
    mode_audio19(num_sample,:)=[19,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode20(num_sample,:)=[20,y]; 
    mode_audio20(num_sample,:)=[20,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode21(num_sample,:)=[21,y];
    mode_audio21(num_sample,:)=[21,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode22(num_sample,:)=[22,y];
    mode_audio22(num_sample,:)=[22,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode23(num_sample,:)=[23,y];
    mode_audio23(num_sample,:)=[23,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode24(num_sample,:)=[24,y];
    mode_audio24(num_sample,:)=[24,yr];
    
    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode25(num_sample,:)=[25,y];
    mode_audio25(num_sample,:)=[25,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode26(num_sample,:)=[26,y];
    mode_audio26(num_sample,:)=[26,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode27(num_sample,:)=[27,y];
    mode_audio27(num_sample,:)=[27,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode28(num_sample,:)=[28,y];
    mode_audio28(num_sample,:)=[28,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode29(num_sample,:)=[29,y];
    mode_audio29(num_sample,:)=[29,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode30(num_sample,:)=[30,y];
    mode_audio30(num_sample,:)=[30,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%Ã»ÓÐ¼ÓÈëÄÜÁ¿
    audio_inf = audio_inf/sqrt(sum(audio_inf.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+audio_inf;
    y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    mode31(num_sample,:)=[31,y];
    mode_audio31(num_sample,:)=[31,yr];
end

if snr <0
    fdata = strcat('test_audio','_',num2str(abs(snr)));
else
    fdata = strcat('test_audio', num2str(snr));
end

test_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end);...
    mode16(1:N_train,2:end);mode17(1:N_train,2:end);mode18(1:N_train,2:end);mode19(1:N_train,2:end);mode20(1:N_train,2:end);...
    mode21(1:N_train,2:end);mode22(1:N_train,2:end);mode23(1:N_train,2:end);mode24(1:N_train,2:end);mode25(1:N_train,2:end);...
    mode26(1:N_train,2:end);mode27(1:N_train,2:end);mode28(1:N_train,2:end);mode29(1:N_train,2:end);mode30(1:N_train,2:end);mode31(1:N_train,2:end)];

test_x_audio=[mode_audio1(1:N_train,2:end);mode_audio2(1:N_train,2:end);mode_audio3(1:N_train,2:end);mode_audio4(1:N_train,2:end);mode_audio5(1:N_train,2:end);...
    mode_audio6(1:N_train,2:end);mode_audio7(1:N_train,2:end);mode_audio8(1:N_train,2:end);mode_audio9(1:N_train,2:end);mode_audio10(1:N_train,2:end);...
    mode_audio11(1:N_train,2:end);mode_audio12(1:N_train,2:end);mode_audio13(1:N_train,2:end);mode_audio14(1:N_train,2:end);mode_audio15(1:N_train,2:end);...
    mode_audio16(1:N_train,2:end);mode_audio17(1:N_train,2:end);mode_audio18(1:N_train,2:end);mode_audio19(1:N_train,2:end);mode_audio20(1:N_train,2:end);...
    mode_audio21(1:N_train,2:end);mode_audio22(1:N_train,2:end);mode_audio23(1:N_train,2:end);mode_audio24(1:N_train,2:end);mode_audio25(1:N_train,2:end);...
    mode_audio26(1:N_train,2:end);mode_audio27(1:N_train,2:end);mode_audio28(1:N_train,2:end);mode_audio29(1:N_train,2:end);mode_audio30(1:N_train,2:end);mode_audio31(1:N_train,2:end)];

% test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
%     mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
%     mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);...
%     mode16(N_train+1:end,2:end);mode17(N_train+1:end,2:end);mode18(N_train+1:end,2:end);mode19(N_train+1:end,2:end);mode20(N_train+1:end,2:end);...
%     mode21(N_train+1:end,2:end);mode22(N_train+1:end,2:end);mode23(N_train+1:end,2:end);mode24(N_train+1:end,2:end);mode25(N_train+1:end,2:end);...
%     mode26(N_train+1:end,2:end);mode27(N_train+1:end,2:end);mode28(N_train+1:end,2:end);mode29(N_train+1:end,2:end);mode30(N_train+1:end,2:end);mode31(N_train+1:end,2:end)];

test_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1);...
    mode16(1:N_train,1);mode17(1:N_train,1);mode18(1:N_train,1);mode19(1:N_train,1);mode20(1:N_train,1);...
    mode21(1:N_train,1);mode22(1:N_train,1);mode23(1:N_train,1);mode24(1:N_train,1);mode25(1:N_train,1);...
    mode26(1:N_train,1);mode27(1:N_train,1);mode28(1:N_train,1);mode29(1:N_train,1);mode30(1:N_train,1);mode31(1:N_train,1)];

%test_y_audio��test_y��ͬһ��
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
save(strcat('../data/',fdata),'test_x','test_x_audio', 'test_y','-v7.3')

clear test_x  test_x_audio test_y
end

toc
