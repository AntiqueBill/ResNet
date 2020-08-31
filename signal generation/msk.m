function [signal_mod]=msk(N_code,fs,fd,fc,Ac)

%-------------------------------------------------------------------------- 
%�������� 
data_len = N_code;           %��Ԫ���� 
sample_number = fs/fd;          %��������  
 
%������������ź� 
data = rand_binary(data_len) ;
 
%------------;-------------------------------------------------------------- 
%MSK�������� 
[signal_out,I_out,Q_out] = mod_msk(data,data_len,sample_number,fd); 
 
I_temp=I_out; 
Q_temp=Q_out; 


t=1/fs:1/fs:length(I_temp)*1/fs; 
signal_i=I_temp.*cos(2*pi*fc*t); 
signal_q=Q_temp.*sin(2*pi*fc*t); 
signal_mod=Ac*(I_temp.*cos(2*pi*fc*t)-Q_temp.*sin(2*pi*fc*t)); 
% signal_mod1=real((I_temp+j*Q_temp).*exp(j*2*pi*fc*t)); 

