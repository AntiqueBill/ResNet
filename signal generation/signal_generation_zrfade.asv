    %载频3到8GHZ， 采样频率40GHZ， 码元速率2G，FSK频间隔1GHZ，训练集每个2000个，测试集每个500个， -15dB到15dB
close all;
clear all;
clc;
tic

fc=35e6;%载频
fs=4e7;%采样频率
fd=2e6;%码元速率
freqsep=1e6;
Ac=1;
N_code=150;%码元数目
N_sample=500;
N_sample_test=100;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=0;
end_snr=16;
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

Rsym = fd;                % Input symbol rate
Rbit = Rsym;
%Rbit = Rsym * log2(M);      % Input bit rate
Nos = fs/fd;                    % Oversampling factor
ts = (1/Rbit) / Nos/3;        % Input sample period
chan = stdchan(ts, 0, 'cost207RAx6');

for snr = begin_snr:end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (3+5*rand(1))*1e6;
    y=ask8(N_code,fc1,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[1,yr];   
    
    fc2 = (3+5*rand(1))*1e6;
    y=fsk8(N_code,fc2,fs,fd,freqsep,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode2(num_sample,:)=[2,yr];  
    
    fc3 = (3+5*rand(1))*1e6;
    y=psk8(N_code,fc3,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode3(num_sample,:)=[3,yr];  

    fc4 = (3+5*rand(1))*1e6;
    y=qam8(N_code,fc4,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode4(num_sample,:)=[4,yr];
    
    y=LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode5(num_sample,:)=[5,yr];    
    
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode6(num_sample,:)=[6,yr];     
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode7(num_sample,:)=[7,yr];     

    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode8(num_sample,:)=[8,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode9(num_sample,:)=[9,yr]; 
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode10(num_sample,:)=[10,yr];   
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode11(num_sample,:)=[11,yr];  
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode12(num_sample,:)=[12,yr];

    y=psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode13(num_sample,:)=[13,yr]; 

    
    y=psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode14(num_sample,:)=[14,yr]; 
    
    y=qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode15(num_sample,:)=[15,yr]; 

    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode16(num_sample,:)=[16,yr]; 
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode17(num_sample,:)=[17,yr];    
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode18(num_sample,:)=[18,yr]; 
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode19(num_sample,:)=[19,yr]; 
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode20(num_sample,:)=[20,yr]; 

    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode21(num_sample,:)=[21,yr];
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode22(num_sample,:)=[22,yr];
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode23(num_sample,:)=[23,yr];
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode24(num_sample,:)=[24,yr];
    
    y=psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode25(num_sample,:)=[25,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode26(num_sample,:)=[26,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode27(num_sample,:)=[27,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode28(num_sample,:)=[28,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode29(num_sample,:)=[29,yr];
    
    y=fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode30(num_sample,:)=[30,yr];
    
    y=ask8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + fsk8(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + psk8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam8(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + LFM(N_code,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    mode31(num_sample,:)=[31,yr];
end

if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end);...
    mode16(1:N_train,2:end);mode17(1:N_train,2:end);mode18(1:N_train,2:end);mode19(1:N_train,2:end);mode20(1:N_train,2:end);...
    mode21(1:N_train,2:end);mode22(1:N_train,2:end);mode23(1:N_train,2:end);mode24(1:N_train,2:end);mode25(1:N_train,2:end);...
    mode26(1:N_train,2:end);mode27(1:N_train,2:end);mode28(1:N_train,2:end);mode29(1:N_train,2:end);mode30(1:N_train,2:end);mode31(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
    mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);...
    mode16(N_train+1:end,2:end);mode17(N_train+1:end,2:end);mode18(N_train+1:end,2:end);mode19(N_train+1:end,2:end);mode20(N_train+1:end,2:end);...
    mode21(N_train+1:end,2:end);mode22(N_train+1:end,2:end);mode23(N_train+1:end,2:end);mode24(N_train+1:end,2:end);mode25(N_train+1:end,2:end);...
    mode26(N_train+1:end,2:end);mode27(N_train+1:end,2:end);mode28(N_train+1:end,2:end);mode29(N_train+1:end,2:end);mode30(N_train+1:end,2:end);mode31(N_train+1:end,2:end)];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1);...
    mode16(1:N_train,1);mode17(1:N_train,1);mode18(1:N_train,1);mode19(1:N_train,1);mode20(1:N_train,1);...
    mode21(1:N_train,1);mode22(1:N_train,1);mode23(1:N_train,1);mode24(1:N_train,1);mode25(1:N_train,1);...
    mode26(1:N_train,1);mode27(1:N_train,1);mode28(1:N_train,1);mode29(1:N_train,1);mode30(1:N_train,1);mode31(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
    mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1);...
    mode16(N_train+1:end,1);mode17(N_train+1:end,1);mode18(N_train+1:end,1);mode19(N_train+1:end,1);mode20(N_train+1:end,1);...
    mode21(N_train+1:end,1);mode22(N_train+1:end,1);mode23(N_train+1:end,1);mode24(N_train+1:end,1);mode25(N_train+1:end,1);...
    mode26(N_train+1:end,1);mode27(N_train+1:end,1);mode28(N_train+1:end,1);mode29(N_train+1:end,1);mode30(N_train+1:end,1);mode31(N_train+1:end,1)];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../CNN_samples/',fdata),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y test_x test_y
end


toc
