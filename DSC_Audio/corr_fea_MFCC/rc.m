function [R,C] = rc( X )
%  compute correlation matrix R & covariance matrix C
    ns = size(X,1);
    R = normalize_g(X)' * normalize_g(X)/ns;
    C = normalize_f(X)' * normalize_f(X)/ns;

end

 