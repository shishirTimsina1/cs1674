function [x, y, scores, Ih, Iv] = extract_keypoints(image)
%UNTITLED3 Summary of this function goes herw

k = 0.05;
x = [];
y = [];
scores = [];
im = imread(image);
im = rgb2gray(im);
im = im2double(im);

%imshow(im);
num_rows = size(im, 1);
num_cols = size(im, 2);

R = zeros([num_rows num_cols]);

h1 = [-1 0 1];
h2 = [-1 0 1]';
Ih = imfilter(im, h1);
Iv = imfilter(im, h2);

Ih2 = Ih.^2;
Iv2 = Iv.^2;
Ixy = Ih.*Iv;

for i = 1:num_rows
    for j = 1:num_cols
        M = [Ih2(i,j) Ixy(i,j);Ixy(i,j) Iv2(i,j)]; 
        R(i,j) = det(M)-0.01*(trace(M))^2;
        
    end
end


end

