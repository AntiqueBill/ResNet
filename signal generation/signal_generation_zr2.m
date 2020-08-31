%载频3到8MHZ， 采样频率400kHZ， 码元速率20k，FSK频间隔1kHZ，训练集每个2000个，测试集每个500个， -16dB到16dB
close all;
clear all;
clc;
tic

fc=35e6;%载频
fs=4e6;%采样频率
fd=2e4;%码元速率
freqsep=1e3;
Ac=1;
N_code=20;%码元数目
N_sample=2500;
N_sample_test=500;
N_train=N_sample-N_sample_test;
N_fe=27;
begin_snr=-5;
end_snr=15;
kindnum_code=2;
num_code=4;
mode0= zeros(N_sample,N_code*fs/fd+1);
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
data0= zeros(N_sample,79);
data1= zeros(N_sample,79);
data2= zeros(N_sample,79);
data3= zeros(N_sample,79);
data4= zeros(N_sample,79);
data5= zeros(N_sample,79);
data6= zeros(N_sample,79);
data7= zeros(N_sample,79);
data8= zeros(N_sample,79);
data9= zeros(N_sample,79);
data10=zeros(N_sample,79);
data11=zeros(N_sample,79);
data12=zeros(N_sample,79);
data13=zeros(N_sample,79);
data14=zeros(N_sample,79);
data15=zeros(N_sample,79);
data16= zeros(N_sample,79);
data17= zeros(N_sample,79);
data18= zeros(N_sample,79);
data19= zeros(N_sample,79);
data20= zeros(N_sample,79);
data21= zeros(N_sample,79);
data22= zeros(N_sample,79);
data23= zeros(N_sample,79);
data24= zeros(N_sample,79);
data25=zeros(N_sample,79);
data26=zeros(N_sample,79);
data27=zeros(N_sample,79);
data28=zeros(N_sample,79);
data29=zeros(N_sample,79);
data30=zeros(N_sample,79);
wave0= zeros(N_sample,135);
wave1= zeros(N_sample,135);
wave2= zeros(N_sample,135);
wave3= zeros(N_sample,135);
wave4= zeros(N_sample,135);
wave5= zeros(N_sample,135);
wave6= zeros(N_sample,135);
wave7= zeros(N_sample,135);
wave8= zeros(N_sample,135);
wave9= zeros(N_sample,135);
wave10=zeros(N_sample,135);
wave11=zeros(N_sample,135);
wave12=zeros(N_sample,135);
wave13=zeros(N_sample,135);
wave14=zeros(N_sample,135);
wave15=zeros(N_sample,135);
wave16= zeros(N_sample,135);
wave17= zeros(N_sample,135);
wave18= zeros(N_sample,135);
wave19= zeros(N_sample,135);
wave20=zeros(N_sample,135);
wave21=zeros(N_sample,135);
wave22=zeros(N_sample,135);
wave23=zeros(N_sample,135);
wave24=zeros(N_sample,135);
wave25=zeros(N_sample,135);
wave26= zeros(N_sample,135);
wave27= zeros(N_sample,135);
wave28= zeros(N_sample,135);
wave29= zeros(N_sample,135);
wave30=zeros(N_sample,135);

for snr = begin_snr:end_snr
for num_sample=1:N_sample    
    fprintf('current snr=%d,',snr);
    fprintf('   itr=%d\n',num_sample);
    
    fc1 = (3+2*rand(1))*1e6;
    y=ask2(N_code,fc1,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode0(num_sample,:)=[0,ym]; 
    data0(num_sample,:)=[0,yr];
    wave0(num_sample,:)=[0,yw];
 
    fc2 = (3+2*rand(1))*1e6;
    y=fsk2(N_code,fc2,fs,fd,freqsep,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode1(num_sample,:)=[1,ym]; 
    data1(num_sample,:)=[1,yr];
    wave1(num_sample,:)=[1,yw];
    
    
    fc3 = (3+2*rand(1))*1e6;
    y=qpsk(N_code,fc3,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode2(num_sample,:)=[2,ym]; 
    data2(num_sample,:)=[2,yr];
    wave2(num_sample,:)=[2,yw];
   

    fc4 = (3+2*rand(1))*1e6;
    y=qam8(N_code,fc4,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode3(num_sample,:)=[3,ym]; 
    data3(num_sample,:)=[3,yr];
    wave3(num_sample,:)=[3,yw];
    
    y=LFM(N_code,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode4(num_sample,:)=[4,ym]; 
    data4(num_sample,:)=[4,yr];
    wave4(num_sample,:)=[4,yw];    
    
    
    y=(0.5+rand(1))*ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode5(num_sample,:)=[5,ym]; 
    data5(num_sample,:)=[5,yr];
    wave5(num_sample,:)=[5,yw];      
    
    y=(0.5+rand(1))*ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode6(num_sample,:)=[6,ym]; 
    data6(num_sample,:)=[6,yr];
    wave6(num_sample,:)=[6,yw];
    

    y=(0.5+rand(1))*ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode7(num_sample,:)=[7,ym]; 
    data7(num_sample,:)=[7,yr];
    wave7(num_sample,:)=[7,yw];
    
    y=(0.5+rand(1))*ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*LFM(N_code,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode8(num_sample,:)=[8,ym]; 
    data8(num_sample,:)=[8,yr];
    wave8(num_sample,:)=[8,yw]; 
    
    y=(0.5+rand(1))*fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac)+(0.5+rand(1))*qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode9(num_sample,:)=[9,ym]; 
    data9(num_sample,:)=[9,yr];
    wave9(num_sample,:)=[9,yw];  
    
    y=(0.5+rand(1))*fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac)+(0.5+rand(1))*qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode10(num_sample,:)=[10,ym]; 
    data10(num_sample,:)=[10,yr];
    wave10(num_sample,:)=[10,yw]; 
    
    y=(0.5+rand(1))*fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac)+(0.5+rand(1))*LFM(N_code,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode11(num_sample,:)=[11,ym]; 
    data11(num_sample,:)=[11,yr];
    wave11(num_sample,:)=[11,yw];

    y=(0.5+rand(1))*qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode12(num_sample,:)=[12,ym]; 
    data12(num_sample,:)=[12,yr];
    wave12(num_sample,:)=[12,yw];

    y =(0.5+rand(1))*qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*LFM(N_code,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode13(num_sample,:)=[13,ym]; 
    data13(num_sample,:)=[13,yr];
    wave13(num_sample,:)=[13,yw];
    
    y=(0.5+rand(1))*qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+(0.5+rand(1))*LFM(N_code,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode14(num_sample,:)=[14,ym]; 
    data14(num_sample,:)=[14,yr];
    wave14(num_sample,:)=[14,yw];

    y=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac)+qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode15(num_sample,:)=[15,ym]; 
    data15(num_sample,:)=[15,yr];
    wave15(num_sample,:)=[15,yw];
    
    y=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac)+fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac)+qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode16(num_sample,:)=[16,ym]; 
    data16(num_sample,:)=[16,yr];
    wave16(num_sample,:)=[16,yw];    
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode17(num_sample,:)=[17,ym]; 
    data17(num_sample,:)=[17,yr];
    wave17(num_sample,:)=[17,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode18(num_sample,:)=[18,ym]; 
    data18(num_sample,:)=[18,yr];
    wave18(num_sample,:)=[18,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode19(num_sample,:)=[19,ym]; 
    data19(num_sample,:)=[19,yr];
    wave19(num_sample,:)=[19,yw]; 

    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode20(num_sample,:)=[20,ym]; 
    data20(num_sample,:)=[20,yr];
    wave20(num_sample,:)=[20,yw]; 
    
    y1=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode21(num_sample,:)=[21,ym]; 
    data21(num_sample,:)=[21,yr];
    wave21(num_sample,:)=[21,yw];
    
    y1=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode22(num_sample,:)=[22,ym]; 
    data22(num_sample,:)=[22,yr];
    wave22(num_sample,:)=[22,yw];
    
    y1=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y2=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode23(num_sample,:)=[23,ym]; 
    data23(num_sample,:)=[23,yr];
    wave23(num_sample,:)=[23,yw];
    
    y1=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode24(num_sample,:)=[24,ym]; 
    data24(num_sample,:)=[24,yr];
    wave24(num_sample,:)=[24,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y3=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y=y1+y2+y3+y4;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode25(num_sample,:)=[25,ym]; 
    data25(num_sample,:)=[25,yr];
    wave25(num_sample,:)=[25,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y3=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3+y4;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode26(num_sample,:)=[26,ym]; 
    data26(num_sample,:)=[26,yr];
    wave26(num_sample,:)=[26,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y3=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3+y4;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode27(num_sample,:)=[27,ym]; 
    data27(num_sample,:)=[27,yr];
    wave27(num_sample,:)=[27,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3+y4;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode28(num_sample,:)=[28,ym]; 
    data28(num_sample,:)=[28,yr];
    wave28(num_sample,:)=[28,yw];
    
    y1=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y2=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y3=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3+y4;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode29(num_sample,:)=[29,ym]; 
    data29(num_sample,:)=[29,yr];
    wave29(num_sample,:)=[29,yw];
    
    y1=ask2(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y2=fsk2(N_code,(3+2*rand(1))*1e6,fs,fd,freqsep,Ac);
    y3=qpsk(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y4=qam8(N_code,(3+2*rand(1))*1e6,fs,fd,Ac);
    y5=LFM(N_code,fs,fd,Ac);
    y=y1+y2+y3+y4+y5;
    y=awgn(y,snr,'measured','db');
    yh=hilbert(y);
    yr = get_data(y,yh,6);
    yw=get_allwaves(y,yh);
    ym=mapminmax(y);
    mode30(num_sample,:)=[30,ym]; 
    data30(num_sample,:)=[30,yr];
    wave30(num_sample,:)=[30,yw];
end

if snr <0
    fdata = strcat('test','_',num2str(abs(snr)));
else
    fdata = strcat('test', num2str(snr));
end

train_x=[mode0(1:N_train,2:end);mode1(1:N_train,2:end);mode2(1:N_train,2:end);mode3(1:N_train,2:end);mode4(1:N_train,2:end);mode5(1:N_train,2:end);...
    mode6(1:N_train,2:end);mode7(1:N_train,2:end);mode8(1:N_train,2:end);mode9(1:N_train,2:end);mode10(1:N_train,2:end);...
    mode11(1:N_train,2:end);mode12(1:N_train,2:end);mode13(1:N_train,2:end);mode14(1:N_train,2:end);mode15(1:N_train,2:end);...
    mode16(1:N_train,2:end);mode17(1:N_train,2:end);mode18(1:N_train,2:end);mode19(1:N_train,2:end);mode20(1:N_train,2:end);...
    mode21(1:N_train,2:end);mode22(1:N_train,2:end);mode23(1:N_train,2:end);mode24(1:N_train,2:end);mode25(1:N_train,2:end);...
    mode26(1:N_train,2:end);mode27(1:N_train,2:end);mode28(1:N_train,2:end);mode29(1:N_train,2:end);mode30(1:N_train,2:end);];

train_wave_x=[data0(1:N_train,2:end);data1(1:N_train,2:end);data2(1:N_train,2:end);data3(1:N_train,2:end);data4(1:N_train,2:end);data5(1:N_train,2:end);...
    data6(1:N_train,2:end);data7(1:N_train,2:end);data8(1:N_train,2:end);data9(1:N_train,2:end);data10(1:N_train,2:end);...
    data11(1:N_train,2:end);data12(1:N_train,2:end);data13(1:N_train,2:end);data14(1:N_train,2:end);data15(1:N_train,2:end);...
    data16(1:N_train,2:end);data17(1:N_train,2:end);data18(1:N_train,2:end);data19(1:N_train,2:end);data20(1:N_train,2:end);...
    data21(1:N_train,2:end);data22(1:N_train,2:end);data23(1:N_train,2:end);data24(1:N_train,2:end);data25(1:N_train,2:end);...
    data26(1:N_train,2:end);data27(1:N_train,2:end);data28(1:N_train,2:end);data29(1:N_train,2:end);data30(1:N_train,2:end);];

train_allwave_x=[wave0(1:N_train,2:end);wave1(1:N_train,2:end);wave2(1:N_train,2:end);wave3(1:N_train,2:end);wave4(1:N_train,2:end);wave5(1:N_train,2:end);...
    wave6(1:N_train,2:end);wave7(1:N_train,2:end);wave8(1:N_train,2:end);wave9(1:N_train,2:end);wave10(1:N_train,2:end);...
    wave11(1:N_train,2:end);wave12(1:N_train,2:end);wave13(1:N_train,2:end);wave14(1:N_train,2:end);wave15(1:N_train,2:end);...
    wave16(1:N_train,2:end);wave17(1:N_train,2:end);wave18(1:N_train,2:end);wave19(1:N_train,2:end);wave20(1:N_train,2:end);...
    wave21(1:N_train,2:end);wave22(1:N_train,2:end);wave23(1:N_train,2:end);wave24(1:N_train,2:end);wave25(1:N_train,2:end);...
    wave26(1:N_train,2:end);wave27(1:N_train,2:end);wave28(1:N_train,2:end);wave29(1:N_train,2:end);wave30(1:N_train,2:end);];

test_x=[mode0(N_train+1:end,2:end);mode1(N_train+1:end,2:end);mode2(N_train+1:end,2:end);mode3(N_train+1:end,2:end);mode4(N_train+1:end,2:end);mode5(N_train+1:end,2:end);...
    mode6(N_train+1:end,2:end);mode7(N_train+1:end,2:end);mode8(N_train+1:end,2:end);mode9(N_train+1:end,2:end);mode10(N_train+1:end,2:end);...
    mode11(N_train+1:end,2:end);mode12(N_train+1:end,2:end);mode13(N_train+1:end,2:end);mode14(N_train+1:end,2:end);mode15(N_train+1:end,2:end);...
    mode16(N_train+1:end,2:end);mode17(N_train+1:end,2:end);mode18(N_train+1:end,2:end);mode19(N_train+1:end,2:end);mode20(N_train+1:end,2:end);...
    mode21(N_train+1:end,2:end);mode22(N_train+1:end,2:end);mode23(N_train+1:end,2:end);mode24(N_train+1:end,2:end);mode25(N_train+1:end,2:end);...
    mode26(N_train+1:end,2:end);mode27(N_train+1:end,2:end);mode28(N_train+1:end,2:end);mode29(N_train+1:end,2:end);mode30(N_train+1:end,2:end);];

test_wave_x=[data0(N_train+1:end,2:end);data1(N_train+1:end,2:end);data2(N_train+1:end,2:end);data3(N_train+1:end,2:end);data4(N_train+1:end,2:end);data5(N_train+1:end,2:end);...
    data6(N_train+1:end,2:end);data7(N_train+1:end,2:end);data8(N_train+1:end,2:end);data9(N_train+1:end,2:end);data10(N_train+1:end,2:end);...
    data11(N_train+1:end,2:end);data12(N_train+1:end,2:end);data13(N_train+1:end,2:end);data14(N_train+1:end,2:end);data15(N_train+1:end,2:end);...
    data16(N_train+1:end,2:end);data17(N_train+1:end,2:end);data18(N_train+1:end,2:end);data19(N_train+1:end,2:end);data20(N_train+1:end,2:end);...
    data21(N_train+1:end,2:end);data22(N_train+1:end,2:end);data23(N_train+1:end,2:end);data24(N_train+1:end,2:end);data25(N_train+1:end,2:end);...
    data26(N_train+1:end,2:end);data27(N_train+1:end,2:end);data28(N_train+1:end,2:end);data29(N_train+1:end,2:end);data30(N_train+1:end,2:end);];

test_allwave_x=[wave0(N_train+1:end,2:end);wave1(N_train+1:end,2:end);wave2(N_train+1:end,2:end);wave3(N_train+1:end,2:end);wave4(N_train+1:end,2:end);wave5(N_train+1:end,2:end);...
    wave6(N_train+1:end,2:end);wave7(N_train+1:end,2:end);wave8(N_train+1:end,2:end);wave9(N_train+1:end,2:end);wave10(N_train+1:end,2:end);...
    wave11(N_train+1:end,2:end);wave12(N_train+1:end,2:end);wave13(N_train+1:end,2:end);wave14(N_train+1:end,2:end);wave15(N_train+1:end,2:end);...
    wave16(N_train+1:end,2:end);wave17(N_train+1:end,2:end);wave18(N_train+1:end,2:end);wave19(N_train+1:end,2:end);wave20(N_train+1:end,2:end);...
    wave21(N_train+1:end,2:end);wave22(N_train+1:end,2:end);wave23(N_train+1:end,2:end);wave24(N_train+1:end,2:end);wave25(N_train+1:end,2:end);...
    wave26(N_train+1:end,2:end);wave27(N_train+1:end,2:end);wave28(N_train+1:end,2:end);wave29(N_train+1:end,2:end);wave30(N_train+1:end,2:end);];


train_y=[mode0(1:N_train,1);mode1(1:N_train,1);mode2(1:N_train,1);mode3(1:N_train,1);mode4(1:N_train,1);mode5(1:N_train,1);...
    mode6(1:N_train,1);mode7(1:N_train,1);mode8(1:N_train,1);mode9(1:N_train,1);mode10(1:N_train,1);...
    mode11(1:N_train,1);mode12(1:N_train,1);mode13(1:N_train,1);mode14(1:N_train,1);mode15(1:N_train,1);...
    mode16(1:N_train,1);mode17(1:N_train,1);mode18(1:N_train,1);mode19(1:N_train,1);mode20(1:N_train,1);...
    mode21(1:N_train,1);mode22(1:N_train,1);mode23(1:N_train,1);mode24(1:N_train,1);mode25(1:N_train,1);...
    mode26(1:N_train,1);mode27(1:N_train,1);mode28(1:N_train,1);mode29(1:N_train,1);mode30(1:N_train,1);];

test_y=[mode0(N_train+1:end,1);mode1(N_train+1:end,1);mode2(N_train+1:end,1);mode3(N_train+1:end,1);mode4(N_train+1:end,1);mode5(N_train+1:end,1);...
    mode6(N_train+1:end,1);mode7(N_train+1:end,1);mode8(N_train+1:end,1);mode9(N_train+1:end,1);mode10(N_train+1:end,1);...
    mode11(N_train+1:end,1);mode12(N_train+1:end,1);mode13(N_train+1:end,1);mode14(N_train+1:end,1);mode15(N_train+1:end,1);...
    mode16(N_train+1:end,1);mode17(N_train+1:end,1);mode18(N_train+1:end,1);mode19(N_train+1:end,1);mode20(N_train+1:end,1);...
    mode21(N_train+1:end,1);mode22(N_train+1:end,1);mode23(N_train+1:end,1);mode24(N_train+1:end,1);mode25(N_train+1:end,1);...
    mode26(N_train+1:end,1);mode27(N_train+1:end,1);mode28(N_train+1:end,1);mode29(N_train+1:end,1);mode30(N_train+1:end,1);];

disp(strcat('saving',32, fdata,'.mat...'))
save(strcat('../lastdata/',fdata),'train_x','train_allwave_x','train_wave_x','train_y','test_x','test_allwave_x','test_wave_x','test_y','-v7.3')

clear train_x train_wave_x train_allwave_x train_y test_x test_wave_x test_allwave_x test_y
end


toc
