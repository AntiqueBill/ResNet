close all;
clear all;
clc;
tic

fc=8e7;%
fs=4e8;%
fd=2e6;%
freqsep=1e6;
Ac=1;
N_code=20;%
N_sample= 500;
N_sample_test=500;
N_train=500;
N_fe=27;

%
% f0=9e7;
% f1=9.3e7;
% f2=9.5e7;    
% audio_inf = audio(1, fs, N_code*fs/fd,  f0,  f1,  f2);%
% %
% fc_pluse = 9e7;
% pulse = jam_pulse(1 , fs,  fc_pluse, N_code*fs/fd);
% %
% zaidai = jam_zaidai(1, N_code*fs/fd, 1);
% %
% lfm = LFM(N_code,fs,fd,Ac);

begin_snr=0;
end_snr=15;
kindnum_code=2;
num_code=4;
% mode1= zeros(N_sample,N_code*fs/fd+1);
% mode2= zeros(N_sample,N_code*fs/fd+1);
% mode3= zeros(N_sample,N_code*fs/fd+1);
% mode4= zeros(N_sample,N_code*fs/fd+1);
% mode5= zeros(N_sample,N_code*fs/fd+1);
% mode6= zeros(N_sample,N_code*fs/fd+1);
% mode7= zeros(N_sample,N_code*fs/fd+1);
% mode8= zeros(N_sample,N_code*fs/fd+1);
% mode9= zeros(N_sample,N_code*fs/fd+1);
% mode10=zeros(N_sample,N_code*fs/fd+1);
% mode11=zeros(N_sample,N_code*fs/fd+1);
% mode12=zeros(N_sample,N_code*fs/fd+1);
% mode13=zeros(N_sample,N_code*fs/fd+1);
% mode14=zeros(N_sample,N_code*fs/fd+1);
% mode15=zeros(N_sample,N_code*fs/fd+1);
% mode16=zeros(N_sample,N_code*fs/fd+1);
% mode17=zeros(N_sample,N_code*fs/fd+1);
% mode18=zeros(N_sample,N_code*fs/fd+1);
% mode19=zeros(N_sample,N_code*fs/fd+1);
% mode20=zeros(N_sample,N_code*fs/fd+1);
% mode21=zeros(N_sample,N_code*fs/fd+1);
% mode22=zeros(N_sample,N_code*fs/fd+1);
% mode23=zeros(N_sample,N_code*fs/fd+1);
% mode24=zeros(N_sample,N_code*fs/fd+1);
% mode25=zeros(N_sample,N_code*fs/fd+1);
% mode26=zeros(N_sample,N_code*fs/fd+1);
% mode27=zeros(N_sample,N_code*fs/fd+1);
% mode28=zeros(N_sample,N_code*fs/fd+1);
% mode29=zeros(N_sample,N_code*fs/fd+1);
% mode30=zeros(N_sample,N_code*fs/fd+1);
% mode31=zeros(N_sample,N_code*fs/fd+1);
mode_lfm1= zeros(N_sample,N_code*fs/fd+1);
mode_lfm2= zeros(N_sample,N_code*fs/fd+1);
mode_lfm3= zeros(N_sample,N_code*fs/fd+1);
mode_lfm4= zeros(N_sample,N_code*fs/fd+1);
mode_lfm5= zeros(N_sample,N_code*fs/fd+1);
mode_lfm6= zeros(N_sample,N_code*fs/fd+1);
mode_lfm7= zeros(N_sample,N_code*fs/fd+1);
mode_lfm8= zeros(N_sample,N_code*fs/fd+1);
mode_lfm9= zeros(N_sample,N_code*fs/fd+1);
mode_lfm10=zeros(N_sample,N_code*fs/fd+1);
mode_lfm11=zeros(N_sample,N_code*fs/fd+1);
mode_lfm12=zeros(N_sample,N_code*fs/fd+1);
mode_lfm13=zeros(N_sample,N_code*fs/fd+1);
mode_lfm14=zeros(N_sample,N_code*fs/fd+1);
mode_lfm15=zeros(N_sample,N_code*fs/fd+1);
mode_lfm16=zeros(N_sample,N_code*fs/fd+1);
mode_lfm17=zeros(N_sample,N_code*fs/fd+1);
mode_lfm18=zeros(N_sample,N_code*fs/fd+1);
mode_lfm19=zeros(N_sample,N_code*fs/fd+1);
mode_lfm20=zeros(N_sample,N_code*fs/fd+1);
mode_lfm21=zeros(N_sample,N_code*fs/fd+1);
mode_lfm22=zeros(N_sample,N_code*fs/fd+1);
mode_lfm23=zeros(N_sample,N_code*fs/fd+1);
mode_lfm24=zeros(N_sample,N_code*fs/fd+1);
mode_lfm25=zeros(N_sample,N_code*fs/fd+1);
mode_lfm26=zeros(N_sample,N_code*fs/fd+1);
mode_lfm27=zeros(N_sample,N_code*fs/fd+1);
mode_lfm28=zeros(N_sample,N_code*fs/fd+1);
mode_lfm29=zeros(N_sample,N_code*fs/fd+1);
mode_lfm30=zeros(N_sample,N_code*fs/fd+1);
mode_lfm31=zeros(N_sample,N_code*fs/fd+1);

%fc_pluse = 9e7;
for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (8+2*rand(1))*1e7;
    y=ask2(N_code,fc1,fs,fd,Ac); 
    y=y/sqrt(sum(y.^2));   
%     pulse = jam_pulse(1 , fs,  fc_pluse, N_code*fs/fd);
%     pulse = pulse/sqrt(sum(pulse.^2));
%     zaidai = jam_zaidai(1, N_code*fs/fd, 1);
%     zaidai = zaidai/sqrt(sum(zaidai.^2));
%     %脡篓脝碌赂脡脠脜
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode1(num_sample,:)=[1,y];   
    mode_lfm1(num_sample,:)=[1,yr];
    
    fc2 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,fc2,fs,fd,freqsep,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode2(num_sample,:)=[2,y];  
    mode_lfm2(num_sample,:)=[2,yr];
    
    fc3 = (8+2*rand(1))*1e7;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode3(num_sample,:)=[3,y];  
    mode_lfm3(num_sample,:)=[3,yr];

    fc4 = (8+2*rand(1))*1e7;
    y=qam16(N_code,fc4,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode4(num_sample,:)=[4,y];
    mode_lfm4(num_sample,:)=[4,yr];
    
    fc5 = (8+2*rand(1))*1e7;
    y=qam64(N_code,fc5,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode5(num_sample,:)=[5,y];    
    mode_lfm5(num_sample,:)=[5,yr];
      
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode6(num_sample,:)=[6,y];     
    mode_lfm6(num_sample,:)=[6,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode7(num_sample,:)=[7,y];   
    mode_lfm7(num_sample,:)=[7,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode8(num_sample,:)=[8,y];
    mode_lfm8(num_sample,:)=[8,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode9(num_sample,:)=[9,y]; 
    mode_lfm9(num_sample,:)=[9,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode10(num_sample,:)=[10,y];   
    mode_lfm10(num_sample,:)=[10,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode11(num_sample,:)=[11,y];  
    mode_lfm11(num_sample,:)=[11,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode12(num_sample,:)=[12,y];
    mode_lfm12(num_sample,:)=[12,yr];

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode13(num_sample,:)=[13,y]; 
    mode_lfm13(num_sample,:)=[13,yr];

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode14(num_sample,:)=[14,y]; 
    mode_lfm14(num_sample,:)=[14,yr];
    
    y=qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode15(num_sample,:)=[15,y]; 
    mode_lfm15(num_sample,:)=[15,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode16(num_sample,:)=[16,y]; 
    mode_lfm16(num_sample,:)=[16,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode17(num_sample,:)=[17,y];   
    mode_lfm17(num_sample,:)=[17,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode18(num_sample,:)=[18,y]; 
    mode_lfm18(num_sample,:)=[18,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode19(num_sample,:)=[19,y]; 
    mode_lfm19(num_sample,:)=[19,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode20(num_sample,:)=[20,y]; 
    mode_lfm20(num_sample,:)=[20,yr];

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) +  qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode21(num_sample,:)=[21,y];
    mode_lfm21(num_sample,:)=[21,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode22(num_sample,:)=[22,y];
    mode_lfm22(num_sample,:)=[22,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode23(num_sample,:)=[23,y];
    mode_lfm23(num_sample,:)=[23,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode24(num_sample,:)=[24,y];
    mode_lfm24(num_sample,:)=[24,yr];
    
    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode25(num_sample,:)=[25,y];
    mode_lfm25(num_sample,:)=[25,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode26(num_sample,:)=[26,y];
    mode_lfm26(num_sample,:)=[26,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
   % mode27(num_sample,:)=[27,y];
    mode_lfm27(num_sample,:)=[27,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode28(num_sample,:)=[28,y];
    mode_lfm28(num_sample,:)=[28,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode29(num_sample,:)=[29,y];
    mode_lfm29(num_sample,:)=[29,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode30(num_sample,:)=[30,y];
    mode_lfm30(num_sample,:)=[30,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam16(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qam64(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    y=y/sqrt(sum(y.^2));
    lfm = LFM(N_code,fs,fd,Ac);
    lfm= lfm/sqrt(sum(lfm.^2));
    y=awgn(y,snr,'measured','db');
    yr = y+lfm;
    %y = mapminmax(y, 0, 1);
    yr = mapminmax(yr, 0, 1);
    %mode31(num_sample,:)=[31,y];
    mode_lfm31(num_sample,:)=[31,yr];
end

if snr <0
    fdata = strcat('test_lfm','_',num2str(abs(snr)));
else
    fdata = strcat('test_lfm', num2str(snr));
end

% test_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
%     mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
%     mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end);...
%     mode16(1:N_train,2:end);mode17(1:N_train,2:end);mode18(1:N_train,2:end);mode19(1:N_train,2:end);mode20(1:N_train,2:end);...
%     mode21(1:N_train,2:end);mode22(1:N_train,2:end);mode23(1:N_train,2:end);mode24(1:N_train,2:end);mode25(1:N_train,2:end);...
%     mode26(1:N_train,2:end);mode27(1:N_train,2:end);mode28(1:N_train,2:end);mode29(1:N_train,2:end);mode30(1:N_train,2:end);mode31(1:N_train,2:end)];

test_x_lfm=[mode_lfm1(1:N_train,2:end);mode_lfm2(1:N_train,2:end);mode_lfm3(1:N_train,2:end);mode_lfm4(1:N_train,2:end);mode_lfm5(1:N_train,2:end);...
    mode_lfm6(1:N_train,2:end);mode_lfm7(1:N_train,2:end);mode_lfm8(1:N_train,2:end);mode_lfm9(1:N_train,2:end);mode_lfm10(1:N_train,2:end);...
    mode_lfm11(1:N_train,2:end);mode_lfm12(1:N_train,2:end);mode_lfm13(1:N_train,2:end);mode_lfm14(1:N_train,2:end);mode_lfm15(1:N_train,2:end);...
    mode_lfm16(1:N_train,2:end);mode_lfm17(1:N_train,2:end);mode_lfm18(1:N_train,2:end);mode_lfm19(1:N_train,2:end);mode_lfm20(1:N_train,2:end);...
    mode_lfm21(1:N_train,2:end);mode_lfm22(1:N_train,2:end);mode_lfm23(1:N_train,2:end);mode_lfm24(1:N_train,2:end);mode_lfm25(1:N_train,2:end);...
    mode_lfm26(1:N_train,2:end);mode_lfm27(1:N_train,2:end);mode_lfm28(1:N_train,2:end);mode_lfm29(1:N_train,2:end);mode_lfm30(1:N_train,2:end);mode_lfm31(1:N_train,2:end)];

% test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
%     mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
%     mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);...
%     mode16(N_train+1:end,2:end);mode17(N_train+1:end,2:end);mode18(N_train+1:end,2:end);mode19(N_train+1:end,2:end);mode20(N_train+1:end,2:end);...
%     mode21(N_train+1:end,2:end);mode22(N_train+1:end,2:end);mode23(N_train+1:end,2:end);mode24(N_train+1:end,2:end);mode25(N_train+1:end,2:end);...
%     mode26(N_train+1:end,2:end);mode27(N_train+1:end,2:end);mode28(N_train+1:end,2:end);mode29(N_train+1:end,2:end);mode30(N_train+1:end,2:end);mode31(N_train+1:end,2:end)];

test_y=[mode_lfm1(1:N_train,1);mode_lfm2(1:N_train,1);mode_lfm3(1:N_train,1);mode_lfm4(1:N_train,1);mode_lfm5(1:N_train,1);...
    mode_lfm6(1:N_train,1);mode_lfm7(1:N_train,1);mode_lfm8(1:N_train,1);mode_lfm9(1:N_train,1);mode_lfm10(1:N_train,1);...
    mode_lfm11(1:N_train,1);mode_lfm12(1:N_train,1);mode_lfm13(1:N_train,1);mode_lfm14(1:N_train,1);mode_lfm15(1:N_train,1);...
    mode_lfm16(1:N_train,1);mode_lfm17(1:N_train,1);mode_lfm18(1:N_train,1);mode_lfm19(1:N_train,1);mode_lfm20(1:N_train,1);...
    mode_lfm21(1:N_train,1);mode_lfm22(1:N_train,1);mode_lfm23(1:N_train,1);mode_lfm24(1:N_train,1);mode_lfm25(1:N_train,1);...
    mode_lfm26(1:N_train,1);mode_lfm27(1:N_train,1);mode_lfm28(1:N_train,1);mode_lfm29(1:N_train,1);mode_lfm30(1:N_train,1);mode_lfm31(1:N_train,1)];

%test_y_audio和test_y是同一个
% test_y_audio=[mode_lfm1(1:N_train,1);mode_lfm2(1:N_train,1);mode_lfm3(1:N_train,1);mode_lfm4(1:N_train,1);mode_lfm5(1:N_train,1);...
%     mode_lfm6(1:N_train,1);mode_lfm7(1:N_train,1);mode_lfm8(1:N_train,1);mode_lfm9(1:N_train,1);mode_lfm10(1:N_train,1);...
%     mode_lfm11(1:N_train,1);mode_lfm12(1:N_train,1);mode_lfm13(1:N_train,1);mode_lfm14(1:N_train,1);mode_lfm15(1:N_train,1);...
%     mode_lfm16(1:N_train,1);mode_lfm17(1:N_train,1);mode_lfm18(1:N_train,1);mode_lfm19(1:N_train,1);mode_lfm20(1:N_train,1);...
%     mode_lfm21(1:N_train,1);mode_lfm22(1:N_train,1);mode_lfm23(1:N_train,1);mode_lfm24(1:N_train,1);mode_lfm25(1:N_train,1);...
%     mode_lfm26(1:N_train,1);mode_lfm27(1:N_train,1);mode_lfm28(1:N_train,1);mode_lfm29(1:N_train,1);mode_lfm30(1:N_train,1);mode_lfm31(1:N_train,1)];

% test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
%     mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
%     mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1);...
%     mode16(N_train+1:end,1);mode17(N_train+1:end,1);mode18(N_train+1:end,1);mode19(N_train+1:end,1);mode20(N_train+1:end,1);...
%     mode21(N_train+1:end,1);mode22(N_train+1:end,1);mode23(N_train+1:end,1);mode24(N_train+1:end,1);mode25(N_train+1:end,1);...
%     mode26(N_train+1:end,1);mode27(N_train+1:end,1);mode28(N_train+1:end,1);mode29(N_train+1:end,1);mode30(N_train+1:end,1);mode31(N_train+1:end,1)];


disp(strcat('saving',32, fdata,'_lfm.mat...'))
save(strcat('../data/',fdata),'test_x_lfm', 'test_y','-v7.3')

clear  test_x_lfm test_y
end

toc
