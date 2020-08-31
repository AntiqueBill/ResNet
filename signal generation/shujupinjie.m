clc

train_x1 = [];
train_y1 = [];
test_x1 = [];
test_y1 = [];
for num = 0:15
    file =strcat( 'train', num2str(num));
    load(strcat('../data/train/',file,'.mat'));
    train_x1=[train_x1;train_x];
    train_y1=[train_y1;train_y];
    test_x1=[test_x1;test_x];
    test_y1=[test_y1;test_y];
end

train_x = train_x1;
clear train_x1
train_y = train_y1;
clear train_y1
test_x = test_x1;
clear test_x1
test_y = test_y1;
clear test_y1

file_name = strcat('train',num2str(0),'_',num2str(15));
tic
disp(strcat('start saving', 32,file_name,'.mat, please wait....'))
toc
save(strcat('../data/train',file_name),'train_x','train_y','test_x','test_y','-v7.3')
