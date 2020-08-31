function y=psk8(N_code,fc,fs,fd,Ac)
x=randi([0,7],1,N_code);
N=length(x);
nsamp=fs/fd;
for j=1:N
	 if x(j)==0
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs);
	    end
     elseif x(j)==1
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi/4);
	    end
     elseif x(j)==2
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi/2);
	    end
     elseif x(j)==3
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+3*pi/4);
	    end
     elseif x(j)==4
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi);
	    end
     elseif x(j)==5
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs-3*pi/4);
	    end
     elseif x(j)==6
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs-pi/2);
	    end
     elseif x(j)==7
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs-pi/4);
        end     
    end
end