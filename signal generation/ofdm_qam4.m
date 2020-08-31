function y=ofdm_qam4(N_code,fs,fd)

N=fs/fd;

x=randi([0 3],N_code,N_code);
x1=qammod(x,4);
y1=zeros(N,N_code);

for i=1:N_code
    y1(:,i)=ifft(x1(:,i),N);
end

y=reshape(y1,1,N_code*N);

%for i=1:N_code
%    y1=ifft(x1,N);
 %   y((i-1)*(N+16)+1:i*(N+16))=[y(N:N+16) y1];
%end
