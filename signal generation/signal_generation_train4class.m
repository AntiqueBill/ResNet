 %载频80到100MHZ， 采样频率40MHZ， 码元速率2M，FSK频间隔1MHZ，训练集每个2000个，测试集每个500个， -15dB到15dB
close all;
clear all;
clc;
tic

fc=8e7;%载频
fs=4e8;%采样频率
fd=2e6;%码元速率
freqsep=1e6;
Ac=1;
N_code=15;%码元数目
N_sample=2500;
N_sample_test=500;
N_train=N_sample-N_sample_test;
N_fe=27;
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

for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (8+2*rand(1))*1e7;
    y=ask2(N_code,fc1,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[1,yr];   
    
    fc2 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,fc2,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode2(num_sample,:)=[2,yr];  
    
    fc3 = (8+2*rand(1))*1e7;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode3(num_sample,:)=[3,yr];  

    fc4 = (8+2*rand(1))*1e7;
    y=psk2(N_code,fc4,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode4(num_sample,:)=[4,yr];
      
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode5(num_sample,:)=[5,yr];     
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode6(num_sample,:)=[6,yr];     

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode7(num_sample,:)=[7,yr];
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode8(num_sample,:)=[8,yr];   
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode9(num_sample,:)=[9,yr];  

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode10(num_sample,:)=[10,yr]; 

    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode11(num_sample,:)=[11,yr]; 
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode12(num_sample,:)=[12,yr];    
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode13(num_sample,:)=[13,yr]; 
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode14(num_sample,:)=[14,yr];
    
    y=ask2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode15(num_sample,:)=[15,yr];
    
end

if snr <0
    fdata = strcat('train','-',num2str(abs(snr)));
else
    fdata = strcat('train', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end);];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
    mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1);];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
    mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1);];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../data/train_4cl/',fdata),'train_x','train_y','test_x', 'test_y', '-v7.3')

clear train_x train_y test_x test_y
end


toc
