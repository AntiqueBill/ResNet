function y=psk16(N_code,fc,fs,fd,Ac)
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
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi/8);
	    end
     elseif x(j)==2
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+2*pi/8);
	    end
     elseif x(j)==3
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+3*pi/8);
	    end
     elseif x(j)==4
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+4*pi/8);
	    end
     elseif x(j)==5
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+5*pi/8);
	    end
     elseif x(j)==6
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+6*pi/8);
	    end
     elseif x(j)==7
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+7*pi/8);
        end     
     elseif x(j)==8
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+pi);
	    end
     elseif x(j)==9
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+9*pi/8);
	    end
     elseif x(j)==10
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+10*pi/8);
	    end
     elseif x(j)==11
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+11*pi/8);
	    end
     elseif x(j)==12
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+12*pi/8);
	    end
     elseif x(j)==13
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+13*pi/8);
	    end
     elseif x(j)==14
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+14*pi/8);
        end  
     elseif x(j)==15
	    for i=1:nsamp
		 y((j-1)*nsamp+i)=Ac*cos(2*pi*fc*(i-1)/fs+15*pi/8);
        end
    end
end