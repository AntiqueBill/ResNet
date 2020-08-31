clc
clear all

begin_snr = -20;
end_snr = 4;

train_x1 = [];
train_y1 = [];
test_x1 = [];
test_y1 = [];

N = 100000;
N_test = 20000;
sclice = 10;
N_snr = end_snr - begin_snr;
Num_tr = N / N_snr;
Num_te = N_test / N_snr;
for sc = 1:sclice
for snr =begin_snr:end_snr
    if snr <0
        fdata = strcat('test','_',num2str(abs(snr)));
    else
        fdata = strcat('test', num2str(snr));
    end
    
    load(strcat('../CNN_samples/',fdata,'.mat'))
    
    idx_train = randperm(size(train_x, 1));
    idx_test = randperm(size(test_x, 1));
    
    train_x = train_x(idx_train, :);
    train_y = train_y(idx_train, :);
    test_x = test_x(idx_test, :);
    test_y = test_y(idx_test, :);
    
    train_x1=[train_x1;train_x(1:Num_tr, :)];
    train_y1=[train_y1;train_y(1:Num_tr, :)];
    test_x1=[test_x1;test_x(1:Num_te, :)];
    test_y1=[test_y1;test_y(1:Num_te, :)];
end


train_x = train_x1;
clear train_x1
train_y = train_y1;
clear train_y1
test_x = test_x1;
clear test_x1
test_y = test_y1;
clear test_y1


disp(strcat('Normalizing....'))
 
train_x=(train_x-mean(train_x(:)))/std(test_x(:));
test_x=(test_x-mean(test_x(:)))/std(test_x(:));



file_name = strcat('test',num2str(begin_snr),'_',num2str(end_snr),'_s',num2str(sc));
tic
disp(strcat('start saving', 32,file_name,'.mat, please wait....'))
toc

tic

save(strcat('../CNN_samples/',file_name),'train_x','train_y','test_x','test_y','-v7.3')

toc
end