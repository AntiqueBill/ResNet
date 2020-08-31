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
N_train=2000;
N_fe=27;
begin_snr=20;
end_snr=20;

train_x=[];
train_y=[];

for snr = begin_snr: end_snr
    train_x=zeros(N_train*4,fs/fd*N_code);
    train_y=zeros(N_train*4,1);
for num_sample=1:N_train    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*4+1,:)=yr;
    train_y((num_sample-1)*4+1,:)=1;
    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*4+2,:)=yr;
    train_y((num_sample-1)*4+2,:)=2;       
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*4+3,:)=yr;
    train_y((num_sample-1)*4+3,:)=3;  
    
    y=qam4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*4+4,:)=yr;
    train_y((num_sample-1)*4+4,:)=4;   
end


if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test_pulse', num2str(snr));
end

train_x=(train_x-mean(train_x(:)))/std(train_x(:));

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../CNN_samples/',fdata),'train_x','train_y','-v7.3')

end


toc
