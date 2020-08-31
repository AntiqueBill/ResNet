close all;
clear all;
clc;
tic

fc=3.5;
fs=2;
fd=0.1  ;
freqsep=0.15;
Ac=1;
N_code=50;
N_sample=600;
N_sample_test=100;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=-20;
end_snr=15;
kindnum_code=2;
num_code=4;
mode1= zeros(N_sample,N_code*fs/fd+1);
mode2= zeros(N_sample,N_code*fs/fd+1);
mode3= zeros(N_sample,N_code*fs/fd+1);
mode4= zeros(N_sample,N_code*fs/fd+1);
mode5= zeros(N_sample,N_code*fs/fd+1);
mode6= zeros(N_sample,N_code*fs/fd+1);


for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[1,yr];   
  
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode2(num_sample,:)=[2,yr];    
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode3(num_sample,:)=[3,yr]; 
    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode4(num_sample,:)=[4,yr];   
     

    y=qam16(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode5(num_sample,:)=[5,yr]; 
 
        
    y=msk(N_code,fs,fd,fc,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode6(num_sample,:)=[6,yr]; 

end

if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end)];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1)];

disp(strcat('saving',32, fdata,'_6.mat...'))
save(strcat('../CNN_samples/',fdata),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y test_x test_y
end


toc
