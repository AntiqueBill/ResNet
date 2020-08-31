close all;
clear all;
clc;
tic

fc=7e7;
fs=2e8;
fd=2e6;
freqsep=1e6;
df=25e5;
dalpha=0.25e5;
Ac=1;
N_code = 1000;

N_sample=81;
N_sample_test=1;
N_train=N_sample-N_sample_test;
begin_snr=0;
end_snr=20;
kindnum_code=2;
num_code=4;
N_fe=15;


Rsym = fd;                % Input symbol rate
Rbit = Rsym;
%Rbit = Rsym * log2(M);      % Input bit rate
Nos = fs/fd;                    % Oversampling factor
ts = (1/Rbit) / Nos/3;        % Input sample period


chan = stdchan(ts, 0, 'cost207RAx6');


mode1= zeros(N_sample,N_fe+1);
mode2= zeros(N_sample,N_fe+1);
mode3= zeros(N_sample,N_fe+1);
mode4= zeros(N_sample,N_fe+1);
mode5= zeros(N_sample,N_fe+1);
mode6= zeros(N_sample,N_fe+1);
mode7= zeros(N_sample,N_fe+1);
mode8= zeros(N_sample,N_fe+1);
mode9= zeros(N_sample,N_fe+1);
mode10= zeros(N_sample,N_fe+1);
mode11= zeros(N_sample,N_fe+1);
mode12= zeros(N_sample,N_fe+1);


for snr = begin_snr:3:end_snr
for num_sample=1:N_sample    

    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    y=ask2(N_code,fc,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    mode1(num_sample,:)=[1,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]; 
    
    
    y=fsk2(N_code,fc,fs,fd,freqsep,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode2(num_sample,:)=[2,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7];   
    
    y=fsk4(N_code,fc,fs,fd,freqsep,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode3(num_sample,:)=[3,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7];   
    
    y=fsk8(N_code,fc,fs,fd,freqsep,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode4(num_sample,:)=[4,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7];   
    
    y=psk2(N_code,fc,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode5(num_sample,:)=[5,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]; 
    
    y=psk4(N_code,fc,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode6(num_sample,:)=[6,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7];   
    
    y=psk8(N_code,fc,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    
    mode7(num_sample,:)=[7,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7];   
    
    y=qam16(N_code,fc,fs,fd,Ac);
    yr=real(filter(chan,y));
    yr=awgn(yr,snr,'measured','db');
    yr=mapminmax(yr);
    [r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]=featuressgj_extraction(yr,fc,fs,fd);
    
    mode8(num_sample,:)=[8,r_max,E,m_A,sigma_aa,sigma_ap,sigma_dp,sigma_af,P_max,d_1,d_2,d_3,d_4,d_5,d_6,d_7]; 
    

end


train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end)];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1)];


if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../CNN_samples/',fdata, '_tsne'),'train_x','train_y','test_x','test_y','-v7.3')

clear train_x train_y test_x test_y
end


toc
