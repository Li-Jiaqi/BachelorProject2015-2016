function [ R,C ] = rc( X )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    ns = size(X,1);
    R = normalize_g(X)' * normalize_g(X)/ns;
    C = normalize_f(X)' * normalize_f(X)/ns;

end

