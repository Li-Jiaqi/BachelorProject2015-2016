function score= LMLR( features,GMM_models )
%%% Gives featrues and models, return LMLR
%     Input:
%        features: nbframes * nbfea ,serie of Xt,each row is a frame t
%        Ml,Sl,Mh,Sh: 8 models, range in column
%           l: low  h:high
%     Output:
%        score: a vector of LMLR for 8 threshold

    [nbframes,nbfea]=size(features);
    num_pairs=size(GMM_models,1); % ici =8
    score=zeros(1,num_pairs);
    prob_low=[];
    prob_high=[];
    for i=1:num_pairs
        for t=1:nbframes
            prob_low  = [ prob_low;  pdf( GMM_models{i,1} ,features(t,:) ) ];
            prob_high = [ prob_high; pdf( GMM_models{i,2} ,features(t,:) ) ]; 
        end
        score(i) = log( mean(prob_high)/mean(prob_low) );
    end

end

