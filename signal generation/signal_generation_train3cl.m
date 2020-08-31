 %载频80到100MHZ， 采样频率40MHZ， 码元速率2M，FSK频间隔1MHZ，训练集每个1000个，测试集每个500个， 0dB到15dB
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
N_sample=1500;
N_sample_test=300;
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

for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);

    fc2 = (8+2*rand(1))*1e7;
    y=fsk2(N_code,fc2,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[1,yr];  
    
    fc3 = (8+2*rand(1))*1e7;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode2(num_sample,:)=[2,yr];  

    fc4 = (8+2*rand(1))*1e7;
    y=psk2(N_code,fc4,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode3(num_sample,:)=[3,yr];
      
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode4(num_sample,:)=[4,yr];   
    
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode5(num_sample,:)=[5,yr];  

    y=qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode6(num_sample,:)=[6,yr]; 
     
    y=fsk2(N_code,(8+2*rand(1))*1e7,fs,fd,freqsep,Ac) + qpsk(N_code,(8+2*rand(1))*1e7,fs,fd,Ac) + psk2(N_code,(8+2*rand(1))*1e7,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode7(num_sample,:)=[7,yr];
        
end

if snr <0
    fdata = strcat('train','-',num2str(abs(snr)));
else
    fdata = strcat('train', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1)];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../data/',fdata),'train_x','train_y','test_x', 'test_y', '-v7.3')

clear train_x train_y test_x test_y
end


toc
