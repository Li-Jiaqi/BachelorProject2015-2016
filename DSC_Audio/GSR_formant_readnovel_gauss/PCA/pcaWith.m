function x2 = pcaWith( x ,mean_train,U,k )
    x = bsxfun(@minus,x,mean_train);
    x2=x* U(:,1:k);

end

