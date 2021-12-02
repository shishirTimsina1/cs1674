function [centers] = detectCircles(im, edges, radius, top_k)
quantization_value = 2;
[row, col] = size(edges);

[row_im, col_im] = size(im);
row_im = ceil(row_im/quantization_value);
col_im = ceil(col_im/quantization_value);
H = zeros(row_im,col_im);
centers = [];



for i = 1:row
    x = edges(i);
    y = edges(i,2);
    grad_mag = edges(i,3); 
    grad_orient = edges(i,4);
    a = abs(ceil(y - radius * cosd(grad_orient))) +1;
    b = abs(ceil(x - radius * sind(grad_orient)))+ 1;
    a = ceil(a/quantization_value);
    b = ceil(b/quantization_value);
    H(a,b) = H(a,b) +1; 
end

[~, st] = sort(H(:), 'descend');

highestH = st(1:top_k);

[x,y] = ind2sub(size(H), highestH);

for i = (1:top_k)
    centers(i,1) = x(i) *quantization_value;
    centers(i,2) = y(i) *quantization_value;
end

figure; imshow(im); viscircles(centers, radius * ones(size(centers, 1), 1));
title(['Radius: ',int2str(radius)]);

end

