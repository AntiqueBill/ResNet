function y_sum=ofdm_psk4(N_code,fs,fd)

    carr=N_code;   %子载波个数
    sym_c=N_code;   %每个子载波含有的OFDM符号数
    bit_sym=2;  %每个符号含有的比特数，QPSK调制
    IFFT_n=fs/fd; %IFFT点数
    r=1/10;     %保护间隔和OFDM数据的比例；
    SNR=10;     %信噪比 dB
    %产生信号
    sum=carr*sym_c*bit_sym;
    colume=sum/(2*carr);
    signal=rand(1,sum)>0.5;   %初始信号
    %QPSK调制,QPSK_sig里面存放的是调制后的信号，数目sumQ
    sumQ=sum/2;
    imag=sqrt(-1);                          % 虚部 j
    QPSK=[-1+imag,-1-imag,1+imag,1-imag];   %创建QPSK 映射表
    SIGNAL=zeros(1,sumQ);      %计算并存放调制前的十进制数据
    QPSK_sig=zeros(1,sumQ);    %存放调制后的QPSK信号
    for n=1:sumQ
     SIGNAL(n)=signal(2*n-1)*2+signal(2*n); %将二进制换算成十进制
    end
    for i=1:sumQ
        if SIGNAL(i)==0;
            QPSK_sig(i)=QPSK(1);
        elseif SIGNAL(i)==1;
                QPSK_sig(i)=QPSK(2);
        elseif SIGNAL(i)==2;
             QPSK_sig(i)=QPSK(3);
        elseif SIGNAL(i)==3;
                   QPSK_sig(i)=QPSK(4);
        end
    end                     
    %串/并转换      计算第i个载波上面的信号to_par（i，：）
    colume=sumQ/carr;
    to_par=zeros(carr,colume);
    for i=1:carr  % carr载波个数
        for j=1:colume;  
            to_par(i,j)=QPSK_sig(carr*(j-1)+i);
        end
    end
    colume=sumQ/carr;
    % % to_par=reshape(QPSK_sig,carr,colume);
    %每个子载波上进行 IFFT变换  （调制后的QPSK信号进行IFFT）
    for j=1:colume
          y(:,j)=ifft(to_par(:,j),IFFT_n);  
    end
    
    %for i=1:carr
        %for j=1:colume
            %y_sum(carr*(j-1)+i)=y(i,j);
        %end
    %end
    y_sum=reshape(y,1,IFFT_n*colume);
    %plot(abs(y_sum));
    % % y=ifft(to_par);