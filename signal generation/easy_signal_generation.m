%4种信号，2FSK，BPSK， QPSK， 16QAM混合。载频3到8MHZ， 采样频率400kHZ， 码元速率20k，FSK频间隔1kHZ，训练集每个1000个，测试集每个400个， -10dB到16dB
%已经全部归一化； 
close all;
clear all;
clc;
tic

fc=35e6;%载频
fs=4e6;%采样频率
fd=2e4;%码元速率
freqsep=1e3;
Ac=1;
N_code=50;%码元数目
N_sample=1400;
N_sample_test=400;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=-10;
end_snr=16;
kindnum_code=2;
num_code=4;
%mode1= zeros(N_sample,N_code*fs/fd+1);
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
data1= zeros(N_sample,N_code*fs/fd+1);
data2= zeros(N_sample,N_code*fs/fd+1);
data3= zeros(N_sample,N_code*fs/fd+1);
data4= zeros(N_sample,N_code*fs/fd+1);
data5= zeros(N_sample,N_code*fs/fd+1);
data6= zeros(N_sample,N_code*fs/fd+1);
data7= zeros(N_sample,N_code*fs/fd+1);
data8= zeros(N_sample,N_code*fs/fd+1);
data9= zeros(N_sample,N_code*fs/fd+1);
data10=zeros(N_sample,N_code*fs/fd+1);
data11=zeros(N_sample,N_code*fs/fd+1);
data12=zeros(N_sample,N_code*fs/fd+1);
data13=zeros(N_sample,N_code*fs/fd+1);
data14=zeros(N_sample,N_code*fs/fd+1);
data15=zeros(N_sample,N_code*fs/fd+1);
wave1= zeros(N_sample,N_code*fs/fd+1);
wave2= zeros(N_sample,N_code*fs/fd+1);
wave3= zeros(N_sample,N_code*fs/fd+1);
wave4= zeros(N_sample,N_code*fs/fd+1);
wave5= zeros(N_sample,N_code*fs/fd+1);
wave6= zeros(N_sample,N_code*fs/fd+1);
wave7= zeros(N_sample,N_code*fs/fd+1);
wave8= zeros(N_sample,N_code*fs/fd+1);
wave9= zeros(N_sample,N_code*fs/fd+1);
wave10=zeros(N_sample,N_code*fs/fd+1);
wave11=zeros(N_sample,N_code*fs/fd+1);
wave12=zeros(N_sample,N_code*fs/fd+1);
wave13=zeros(N_sample,N_code*fs/fd+1);
wave14=zeros(N_sample,N_code*fs/fd+1);
wave15=zeros(N_sample,N_code*fs/fd+1);

for snr = begin_snr:2: end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
 
    %第一步：得到信号
    %第二步：加噪声
    %第三步：计算高阶统计量和小波，然后将特征拼接
    %mode：信号本身；data：单个小波；wave：全部小波
    fc1 = (3+5*rand(1))*1e6;
    y=fsk2(N_code,fc1,fs,fd,freqsep,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode1(num_sample,:)=[1,ym]; 
    data1(num_sample,:)=[1,yr];
    wave1(num_sample,:)=[1,yw];
    
    fc2 = (3+5*rand(1))*1e6;
    y=bpsk(N_code,fc2,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode2(num_sample,:)=[2,ym];  
    data2(num_sample,:)=[2,yr];
    wave2(num_sample,:)=[2,yw];
    
    fc3 = (3+5*rand(1))*1e6;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode3(num_sample,:)=[3,ym];  
    data3(num_sample,:)=[3,yr];
    wave3(num_sample,:)=[3,yw];
    
    fc4 = (3+5*rand(1))*1e6;
    y=qam16(N_code,fc4,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode4(num_sample,:)=[4,ym];
    data4(num_sample,:)=[4,yr];
    wave4(num_sample,:)=[4,yw];
     
    y = fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac)+bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y = awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode5(num_sample,:)=[5,ym];
    data5(num_sample,:)=[5,yr];
    wave5(num_sample,:)=[5,yw];
    
    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode6(num_sample,:)=[6,ym];
    data6(num_sample,:)=[6,yr];
    wave6(num_sample,:)=[6,yw];
    
    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac)+ qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db'); 
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode7(num_sample,:)=[7,ym];
    data7(num_sample,:)=[7,yr];
    wave7(num_sample,:)=[7,yw];
    
    y=bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode8(num_sample,:)=[8,ym];
    data8(num_sample,:)=[8,yr];
    wave8(num_sample,:)=[8,yw];
    
    y=bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac)  +  qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode9(num_sample,:)=[9,ym];
    data9(num_sample,:)=[9,yr];
    wave9(num_sample,:)=[9,yw];
    
    
    y=qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac); + qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode10(num_sample,:)=[10,ym];
    data10(num_sample,:)=[10,yr];
    wave10(num_sample,:)=[10,yw]; 
    
    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db'); 
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode11(num_sample,:)=[11,ym];
    data11(num_sample,:)=[11,yr];
    wave11(num_sample,:)=[11,yw]; 
    
    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) + qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode12(num_sample,:)=[12,ym];
    data12(num_sample,:)=[12,yr];
    wave12(num_sample,:)=[12,yw]; 

    
    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode13(num_sample,:)=[13,ym];
    data13(num_sample,:)=[13,yr];
    wave13(num_sample,:)=[13,yw]; 
    
    y=bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac)+ qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode14(num_sample,:)=[14,ym];
    data14(num_sample,:)=[14,yr];
    wave14(num_sample,:)=[14,yw]; 

    y=fsk2(N_code,(3+5*rand(1))*1e6,fs,fd,freqsep,Ac) + bpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac)+ qpsk(N_code,(3+5*rand(1))*1e6,fs,fd,Ac) +  qam16(N_code,(3+5*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y, 0, 1);
    mode15(num_sample,:)=[15,ym];
    data15(num_sample,:)=[15,yr];
    wave15(num_sample,:)=[15,yw];     
end

if snr <0
    fdata = strcat('data','-',num2str(abs(snr)));
else
    fdata = strcat('data', num2str(snr));
end

train_x=[mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end)];
train_wave_x=[data1(1:N_train,2:end);data2(1:N_train,2:end);data3(1:N_train,2:end);data4(1:N_train,2:end);data5(1:N_train,2:end);...
    data6(1:N_train,2:end);data7(1:N_train,2:end);data8(1:N_train,2:end);data9(1:N_train,2:end);data10(1:N_train,2:end);...
    data11(1:N_train,2:end);data12(1:N_train,2:end);data13(1:N_train,2:end);data14(1:N_train,2:end);data15(1:N_train,2:end)];
train_allwave_x=[wave1(1:N_train,2:end);wave2(1:N_train,2:end);wave3(1:N_train,2:end);wave4(1:N_train,2:end);wave5(1:N_train,2:end);...
    wave6(1:N_train,2:end);wave7(1:N_train,2:end);wave8(1:N_train,2:end);wave9(1:N_train,2:end);wave10(1:N_train,2:end);...
    wave11(1:N_train,2:end);wave12(1:N_train,2:end);wave13(1:N_train,2:end);wave14(1:N_train,2:end);wave15(1:N_train,2:end)];

test_x=[mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
    mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end)];
test_wave_x=[data1(N_train+1:end,2:end);data2(N_train+1:end,2:end);data3(N_train+1:end,2:end);data4(N_train+1:end,2:end);data5(N_train+1:end,2:end);...
    data6(N_train+1:end,2:end);data7(N_train+1:end,2:end);data8(N_train+1:end,2:end);data9(N_train+1:end,2:end);data10(N_train+1:end,2:end);...
    data11(N_train+1:end,2:end);data12(N_train+1:end,2:end);data13(N_train+1:end,2:end);data14(N_train+1:end,2:end);data15(N_train+1:end,2:end)];
test_allwave_x=[wave1(N_train+1:end,2:end);wave2(N_train+1:end,2:end);wave3(N_train+1:end,2:end);wave4(N_train+1:end,2:end);wave5(N_train+1:end,2:end);...
    wave6(N_train+1:end,2:end);wave7(N_train+1:end,2:end);wave8(N_train+1:end,2:end);wave9(N_train+1:end,2:end);wave10(N_train+1:end,2:end);...
    wave11(N_train+1:end,2:end);wave12(N_train+1:end,2:end);wave13(N_train+1:end,2:end);wave14(N_train+1:end,2:end);wave15(N_train+1:end,2:end)];

train_y=[mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1)];

test_y=[mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
    mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1)];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../data/',fdata),'train_x','train_wave_x','train_allwave_x','train_y','test_x','test_wave_x','test_allwave_x','test_y','-v7.3')

clear train_x train_wave_x train_allwave_x train_y test_x test_wave_x test_allwave_x test_y
end


toc
