
%%% Gives featrues and models, return LMLR
%     Input:
%        features: nbframes * nbfea ,each row is a frame t
%        Ml,Sl,Mh,Sh: 8 models, range in column
load('htk_204_1_cut_audio_mfcc_delta_corr.mat')
features=htk_204_1_cut_audio_mfcc_delta_corr;
    [nbframes,nbfea]=size(features);
    num_gaussian=size(Ml,2); % =8
    score=zeros(1,num_gaussian);
    pL=[];
    pH=[];
    for i=1:num_gaussian
        for t=1:nbframes
            pH=[pH;estimateGaussian( features(t,:)' ,Mh(:,i),Sh(:,nbfea*(i-1)+1:nbfea*i) )];
            pL=[pL;estimateGaussian(features(t,:)' ,Ml(:,i),Sl(:,nbfea*(i-1)+1:nbfea*i) )];
        end
        score(i)=log(sum(pL)/sum(pH));
    end
