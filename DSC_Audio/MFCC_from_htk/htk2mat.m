%%% convert 'htk' files to '.mat' files
clear all;
count = 0;
for i=333:333
    for j=1:4
        filename=['E:\AVECdata\Development_AudioFeatures\Development\lld_htk\' ...
            num2str(i) '_' num2str(j) '_cut_audio.htk'];
        if exist(filename,'file')~=0
            count = count+1
            load gong;
            sound(y,Fs);
            
            dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio'];
            featrues=[];
            [ features, sampPeriod, parmKind ] = readhtk_lite( filename );  
             eval([dataname,'=features;']);
            savename=[dataname '.mat'];
            eval(['save ',savename,' ',dataname,';']);
            fprintf([dataname ':sampPeriod=%f,parmKind=%f\n'],sampPeriod, parmKind);
        else
            continue;
        end
    end
end