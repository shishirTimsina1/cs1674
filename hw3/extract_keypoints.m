function [x, y, scores, Ih, Iv] = extract_keypoints(image)
%UNTITLED3 Summary of this function goes herw

k = 0.05;
im = imread(image);
im = rgb2gray(im);
% imshow(im);
num_rows = size(im, 1);
num_cols = size(im, 2);

rsltMatrix = zeros([num_rows num_cols]);




end

