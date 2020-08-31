function y=ask16(N_code,fc,fs,fd,Ac)
x=randi([0,15],1,N_code);
N=length(x);
nsamp=fs/fd;
% x=2*x-7;
for j=1:N
    for i=1:nsamp
		y((j-1)*nsamp+i)=sqrt(2/35)*x(j)*Ac*cos(2*pi*fc*(i-1)/fs);
    end
end