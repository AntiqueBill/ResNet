function y=fsk8(N_code,fc,fs,fd,freqsep,Ac)
x=randi([0,7],1,N_code);
N=length(x);
nsamp=fs/fd;
for j=1:N
	if x(j)==0
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc-7*freqsep)*(i-1)/fs);
       end
    elseif x(j)==1
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc-5*freqsep)*(i-1)/fs);
       end
    elseif x(j)==2 
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc-3*freqsep)*(i-1)/fs);
       end
    elseif x(j)==3
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc-freqsep)*(i-1)/fs);
       end
    elseif x(j)==4
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc+freqsep)*(i-1)/fs);
       end
    elseif x(j)==5
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc+3*freqsep)*(i-1)/fs);
       end
    elseif x(j)==6 
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc+5*freqsep)*(i-1)/fs);
       end
	else
	   for i=1:nsamp
		y((j-1)*nsamp+i)=Ac*cos(2*pi*(fc+7*freqsep)*(i-1)/fs);
	   end
	end
end