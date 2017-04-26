function [S,count] = scoreCompute(pathname,GMM_models)
% 'E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training_pca\'
%  'E:\AVECdata\Development_AudioFeatures\Development\MFCC_delta_dev_pca\'
    S=[];
    count=0;
    for i=203:333
       for j=1:4

           dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_delta_pca'];
           filename=[dataname '.mat'];

           if exist([pathname filename],'file')
               count=count+1;
               load([pathname filename]);
               eval( [ 'score' , '= LMLR(' ,dataname ',GMM_models );' ] );
               S=[S;score];
           else 
               continue;
           end

       end
    end

end

