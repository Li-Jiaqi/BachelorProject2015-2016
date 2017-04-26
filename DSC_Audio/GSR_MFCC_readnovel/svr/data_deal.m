train_struct = load('S_train_no.mat');
train = train_struct.S_train_no;
train_label_struct = load('DepressionLabels_training.mat');
train_label = train_label_struct.DepressionLabels_training;
dev_struct = load('S_dev_no.mat');
dev = dev_struct.S_dev_no;
dev_label_struct = load('DepressionLabels_dev.mat');
dev_label = dev_label_struct.DepressionLabels_dev;
fid = fopen('train','wb');
for i = 1:50
    fprintf(fid,'%f\t',train_label(i));
    for j = 1
        fprintf(fid,'%d:%f\t',[j,train(i,j)]);
    end
    if i<50
        fprintf(fid,'\n');
    end
end
fclose(fid);
fid2 = fopen('dev','wb');
for i = 1:50
    fprintf(fid2,'%f\t',dev_label(i));
    for j = 1
        fprintf(fid2,'%d:%f\t',[j,dev(i,j)]);
    end
    if i<50
        fprintf(fid2,'\n');
    end
end
fclose(fid2);
