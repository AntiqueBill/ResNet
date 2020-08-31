    %载频3到8GHZ， 采样频率40MHZ， 码元速率2M，FSK频间隔1MHZ，训练集每个2000个，测试集每个500个， -15dB到15dB
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
N_sample=2500;
N_sample_test=500;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=-6;
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

for snr = begin_snr:3:end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc = (3+2*rand(1))*1e6;
    y=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac) +  LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[12,yr];   
    
end

if snr <0
    fdata = strcat('2fsk+LFM-','_',num2str(abs(snr)));
else
    fdata = strcat('2fsk+LFM-', num2str(snr));
    


end

%train_x=[mode1(1:N_train,2:end)];

train_x=[mode1(1:N_sample,2:end)];


train_y=[mode1(1:N_sample,1)];
    
    
disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../ask2/',fdata),'train_x','train_y')

%train_y=[mode1(1:N_train,1)];



%disp(strcat('saving',32, fdata,'.mat...'))
%save(strcat('../CNN_samples/',fdata),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y 
end


toc
