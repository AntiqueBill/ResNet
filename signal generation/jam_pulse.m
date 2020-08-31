function [ur]=jam_pulse(Ac,fs,fc,N)
%     Ac=1;
%     fs=3e9;
%     fc=2e8;
%     N=15000;
    n=16;
    b=randi(2,1,n)-1;
    N=N/n;
    ur=zeros(1, N);
    % ur=Ac*sin(2*pi*fc*t/fs).*square(2*pi*fp*t,5);
    for t=1:16
        T=(t-1)*N+1:t*N;
        if b(t)==1
            ur(T)=Ac*sin(2*pi*fc*T/fs);
        else
            ur(T)=0;
        end
    end

