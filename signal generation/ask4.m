function y=ask4(N_code,fc,fs,fd,Ac) 
x=randi([0,3],1,N_code);
N=length(x);
nsamp=fs/fd;
% x=2*x-3;
for j=1:N
	for i=1:nsamp
		y((j-1)*nsamp+i)=sqrt(2/7)*x(j)*Ac*cos(2*pi*fc*(i-1)/fs);
    end
end