function [outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k)

[x,y,rgb] = size(origImg);
origImg = double(origImg);

numpixels = x*y;
X = reshape(origImg, [numpixels, 3]);

[idx, C] = kmeans(X, k);

idx = reshape(idx, [x,y]);

for i = 1:x
    if idx(i) == 1
        origImg(:,:,1) = idx(i);
    elseif idx(i) == 2
        origImg(:,:,2) = idx(i);
    else
        origImg(:,:,3) = idx(i);
    end
    
end
outputImg = origImg;
meanColors =[];
clusterIds = [];
imshow(origImg);

end

