function [y]=LFM(N_code,fs,fd,Ac)
%     Ac=1;
%     fs=10e9;
%     fd=10e7;
%     N=1500;
%     N_code=1;
    
    N_samples=fs/fd;
    N=N_code*N_samples;
    begin_fre=randi([1,10],1,1)*0.5;
    end_fre=begin_fre+randi([1,5],1,1)*0.3;
    f0=begin_fre;
    dt=1/fs;
    B=end_fre-begin_fre;
    T=N*dt;
    k=B/T;
    t=linspace(0,T,N);
    y=Ac*exp(1i*(2*pi*f0*t+2*pi*k*t.^2));
    y=real(y);
    
%     figure(1);
%     plot(t,y);
%     title('ɨƵ�����ź�ʱ����');
%     xlabel('ʱ��)')
%     ylabel('��ȣ�V��')
%     axis([0,T/2,-1.2,1.2]);
% 
%     fft_y=fftshift(fft(y));
%     f=linspace(-fs/2,fs/2,N);
%     figure(2);
%     plot(f,abs(fft_y),'LineWidth',1.5);
%     title('ɨƵ�����ź�Ƶ����');
%     xlabel('Ƶ�ʣ�Hz��');
%     ylabel('���?');
%     axis([2e9,6e9,0,100]);