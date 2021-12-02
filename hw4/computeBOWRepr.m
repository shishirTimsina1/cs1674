function [bow_repr] = computeBOWRepr(features, means)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%filenames{ind};


[sz1,~] = size(means);

[sz,~] = size(features);
bow_repr = zeros(1,sz1);

D = zeros(sz1,8);
for ind = 1:sz
    curFeature = features(ind,:);
    for ind2 = 1:sz1
       curMeanRow = means(ind2,:);
       D(ind2,:) = pdist2(curFeature, curMeanRow);
    end
        [s,ind5] = min(D);
        bow_repr(ind5)= bow_repr(ind5)+1;
        bow_repr = bow_repr/sum(bow_repr);
    
    
end
            
end

