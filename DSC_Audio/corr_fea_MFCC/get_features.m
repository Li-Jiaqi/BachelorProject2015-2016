clear all;
count=0;
for i=203:333
    for j=1:4
        %  dev  E:\AVECdata\Development_AudioFeatures\Development\mfcc32_mat_dev
        %  train E:\AVECdata\Training_AudioFeatures\Training\mfcc32_mat_train
        filename=['E:\AVECdata\Development_AudioFeatures\Development\mfcc32_mat_dev\htk_' ...
            num2str(i) '_' num2str(j) '_cut_audio_mfcc.mat'];
        
        if exist(filename,'file')~=0
            dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc'];
            count=count+1
            
            load(filename);
%%          mfcc delta
%              eval(['temp=' dataname '(:,17:32);']);
%%          mfcc
            eval(['temp=' dataname '(:,1:16);']);
%%
            [nbblock]=get_blocks(temp,6000,3000);
            features=[];
            for num=2:nbblock
                fea_num = [];
                [X1,X2,X3,X4]=getX_MFCC(temp,num);
                fea_num=[corr_fea_extract(X1),corr_fea_extract(X2),corr_fea_extract(X3),corr_fea_extract(X4)];
                features = [features;fea_num];
            end
            
%%          mfcc delta
%             ansname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_delta_corr'];
%%          mfcc
           ansname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_corr'];
%%
            eval([ansname '=features;']);
            savename=[ansname '.mat'];
            eval(['save ',savename,' ',ansname,';']);
            
        else
            continue;
        end
        
    end    
end
