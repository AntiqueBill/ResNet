close all;
clear all;
clc;
tic

fc=3.5;
fs=20;
fd=0.1  ;
freqsep=0.2;
Ac=1;
N_code=20;
N_sample=21000;
N_sample_test=1000;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=20;
end_snr=20;
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
mode10= zeros(N_sample,N_code*fs/fd+1);
mode11=zeros(N_sample,N_code*fs/fd+1);
mode12=zeros(N_sample,N_code*fs/fd+1);
mode13= zeros(N_sample,N_code*fs/fd+1);
mode14= zeros(N_sample,N_code*fs/fd+1);
mode15= zeros(N_sample,N_code*fs/fd+1);

for snr = begin_snr: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode1(num_sample,:)=[1,yr];   
    
    y=ask4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode2(num_sample,:)=[2,yr];  
    
    
    y=ask8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    mode3(num_sample,:)=[3,yr];  
    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode4(num_sample,:)=[4,yr];    
    
    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode5(num_sample,:)=[5,yr];     
    
    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode6(num_sample,:)=[6,yr];     
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode7(num_sample,:)=[7,yr]; 
    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode8(num_sample,:)=[8,yr];   
    
    y=psk8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode9(num_sample,:)=[9,yr];  
    
    y=qam4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode10(num_sample,:)=[10,yr]; 
    
    y=qam16(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode11(num_sample,:)=[11,yr]; 
    
    y=qam64(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode12(num_sample,:)=[12,yr];    
    
    y=real(ofdm_psk4(N_code,fs,fd));
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode13(num_sample,:)=[13,yr]; 
    
    y=LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode14(num_sample,:)=[14,yr]; 
    
    y=msk(N_code,fs,fd,fc,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    mode15(num_sample,:)=[15,yr]; 

end

if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
    mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end)];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
    mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1)];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('F:/CNN_samples/',fdata),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y test_x test_y
end


toc
