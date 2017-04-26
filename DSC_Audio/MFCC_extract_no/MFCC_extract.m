clear all;
count = 0;
for i=203:332
    for j=1:4
        filename=['E:\AVECdata\MFCC\development\' num2str(i) '_' num2str(j) '_cut_audio.mp3'];
        if exist(filename,'file')~=0
            count = count+1
            load gong;
            sound(y,Fs);
%             signals=[];
%             Sample_rate=[];
            [signals, Sample_rate]=audioread(filename);
            dataname=['MFCC_' num2str(i) '_' num2str(j) '_cut_audio'];
            eval([dataname,'= mfcc(signals, Sample_rate);']);
            savename=[dataname '.mat'];
            eval(['save ',savename,' ',dataname,';']);
            save dataname;
        else
            continue;
        end
    end
end