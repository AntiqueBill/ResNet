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
N_sample=100;
N_test=50;
N_train=N_sample-N_test;
N_fe=27;
begin_snr=10;
end_snr=10;
kindnum_code=2;
num_code=4;

train_x=[];
train_y=[];
test_x=[];
test_y=[];

for snr = begin_snr: end_snr
    train_x=zeros(N_train*15,fs/fd*N_code);
    train_y=zeros(N_train*15,1);
    test_x=zeros(N_test*15,fs/fd*N_code);
    test_y=zeros(N_test*15,1);
for num_sample=1:N_train    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+1,:)=yr;
    train_y((num_sample-1)*15+1,:)=1;
    
    y=ask4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+2,:)=yr;
    train_y((num_sample-1)*15+2,:)=2; 
    
    
    y=ask8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+3,:)=yr;
    train_y((num_sample-1)*15+3,:)=3;  
    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+4,:)=yr;
    train_y((num_sample-1)*15+4,:)=4;    
    
    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+5,:)=yr;
    train_y((num_sample-1)*15+5,:)=5;    
    
    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+6,:)=yr;
    train_y((num_sample-1)*15+6,:)=6;    
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+7,:)=yr;
    train_y((num_sample-1)*15+7,:)=7; 
    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+8,:)=yr;
    train_y((num_sample-1)*15+8,:)=8; 
    
    y=psk8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+9,:)=yr;
    train_y((num_sample-1)*15+9,:)=9; 
    
    y=qam4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+10,:)=yr;
    train_y((num_sample-1)*15+10,:)=10; 
    
    y=qam16(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+11,:)=yr;
    train_y((num_sample-1)*15+11,:)=11;
    
    y=qam64(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+12,:)=yr;
    train_y((num_sample-1)*15+12,:)=12;   
    
    y=real(ofdm_psk4(N_code,fs,fd));
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+13,:)=yr;
    train_y((num_sample-1)*15+13,:)=13;
    
    y=LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+14,:)=yr;
    train_y((num_sample-1)*15+14,:)=14;
    
    y=msk(N_code,fs,fd,fc,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    train_x((num_sample-1)*15+15,:)=yr;
    train_y((num_sample-1)*15+15,:)=15;

end

for num_sample=1:N_test    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+1,:)=yr;
    test_y((num_sample-1)*15+1,:)=1;
    
    y=ask4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+2,:)=yr;
    test_y((num_sample-1)*15+2,:)=2; 
    
    
    y=ask8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db'); 
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+3,:)=yr;
    test_y((num_sample-1)*15+3,:)=3;  
    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+4,:)=yr;
    test_y((num_sample-1)*15+4,:)=4;    
    
    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+5,:)=yr;
    test_y((num_sample-1)*15+5,:)=5;    
    
    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+6,:)=yr;
    test_y((num_sample-1)*15+6,:)=6;    
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+7,:)=yr;
    test_y((num_sample-1)*15+7,:)=7; 
    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+8,:)=yr;
    test_y((num_sample-1)*15+8,:)=8; 
    
    y=psk8(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+9,:)=yr;
    test_y((num_sample-1)*15+9,:)=9; 
    
    y=qam4(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+10,:)=yr;
    test_y((num_sample-1)*15+10,:)=10; 
    
    y=qam16(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+11,:)=yr;
    test_y((num_sample-1)*15+11,:)=11;
    
    y=qam64(N_code,fc,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+12,:)=yr;
    test_y((num_sample-1)*15+12,:)=12;   
    
    y=real(ofdm_psk4(N_code,fs,fd));
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+13,:)=yr;
    test_y((num_sample-1)*15+13,:)=13;
    
    y=LFM(N_code,fs,fd,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+14,:)=yr;
    test_y((num_sample-1)*15+14,:)=14;
    
    y=msk(N_code,fs,fd,fc,Ac);
    yr=awgn(y,snr,'measured','db');
    yr=mapminmax(yr);
    test_x((num_sample-1)*15+15,:)=yr;
    test_y((num_sample-1)*15+15,:)=15;

end




if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

train_x=(train_x-mean(test_x(:)))/std(test_x(:));
test_x=(test_x-mean(test_x(:)))/std(test_x(:));

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../CNN_samples/',fdata),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y test_x test_y
end


toc
