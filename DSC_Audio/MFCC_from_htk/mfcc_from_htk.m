%%%          read lld from 'htk' files  
%%%         column :19-34 MFCC 1-16
%%%        cloumn : 49-64 MFCC delta 1-16
clear all;
count = 0; mean
for i=203:333
    for j=1:4
        filename=['E:\AVECdata\Training_AudioFeatures\Training\lld_htk\' ...
            num2str(i) '_' num2str(j) '_cut_audio.htk'];
        if exist(filename,'file')~=0
            count = count+1
            load gong;
            sound(y,Fs);
            
            dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc'];
            features=[];
            [ features, sampPeriod, parmKind ] = readhtk_lite( filename );
            eval([dataname,'=[features(:,19:34), features(:,49:64)];']);
            savename=[dataname '.mat'];
            eval(['save ',savename,' ',dataname,';']);
            fprintf([dataname 'sampPeriod=%f,parmKind=%f\n'],sampPeriod, parmKind);
        else
            continue;
        end
    end
end