function y=psk4(N_code,fc,fs,fd,Ac)
x=randi([0,3],1,N_code);
N=length(x);
nsamp=fs/fd;
for j=1:N
	if x(j)==0
	   for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs);
	    end
    elseif x(j)==1
	   for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi/2);
	    end
    elseif x(j)==2 
	   for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi);
	    end
	else
	   for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs-pi/2);
        end     
    end
end