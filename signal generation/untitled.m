clear all
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

    x=randi([0,15],1,N_code);
    N_samples=fs/fd;%过采样率 

    y=modulate(modem.pammod('M',16),x);%�?4QAM调制器对信号进行 
    
    
    t=1:N_samples;
    carrier=Ac*cos(2*pi*fc*t/fs);%产生信号脉冲g(t) 
    gt=ones(1,length(carrier));

    St_complex=zeros(1,length(carrier)*length(y));
    for n1=1:length(y)
        St_complex((N_samples*(n1-1)+1):(N_samples*(n1-1)+N_samples))=(y(n1)*carrier).*gt;
    end

    z=real(St_complex);