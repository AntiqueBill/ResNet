function y=fsk2(N_code,fc,fs,fd,freqsep,Ac)
x=randi([0,1],1,N_code);
N=length(x);
nsamp=fs/fd;
for j=1:N
	if x(j)==0
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc-freqsep)*(i-1)/fs);
	   end
	else
	   for i=1:nsamp
        y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc+freqsep)*(i-1)/fs);
	   end
	end
end