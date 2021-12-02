%% Compare_representations
% CS1674 HW4
% This script for Part III tests your code from Part I and Part II. You
% only need to change the code which loads the mean clusters (see below). 

% USE/NOTES:
% MAKE SURE TO ADD YOUR HW3 FOLDERS TO THE PATH to use the
% extract_keypoints.m. You can also copy it over to the current folder for
% HW4.
% PLEASE DO NOT SHARE AS FUTURE STUDENTS MIGHT BE ASKED TO IMPLEMENT THIS.

% get list of images for the comparison
im_list = {'cardinal1.jpg', 'cardinal2.jpg', 'leopard1.jpg', 'leopard2.jpg', 'panda1.jpg', 'panda2.jpg'}; 

% load filters. this is from HW2.
F = makeLMfilters;

addpath('./means');
addpath('./means_neg');

% Iterate through different cluster numbers.
for k = [2 5 10 50 100 200]
    
    %%%%%%%%%%%%%%%%%%%%%%% load cluster centers %%%%%%%%%%%%%%%%%%%%%%%
    % Note: USE ONLY ONE OF THE FOLLOWING LOAD FUNCTIONS depending on the
    % extract_keypoints function you are using. Comment out the one you are
    % not using.
    
    % Case 1: If your extract_keypoints outputs negative Ix and Iy using
    % double(Image) for imfilter, load 'means_k_neg' using the following
    % load. These cluster centers are for Ix,Iy with negative values,
    % so the angles ranging from -90 to 90.
    load(strcat('means_k', num2str(k), '_neg'));    % PICK THIS
    
    % Case 2: Otherwise, if you do not double(Image) for imfilter in your
    % extract_keypoints function, load the following. These clusters
    % centers are the angles ranging from 0 to 90.
%     load(strcat('means_k', num2str(k)));            % OR PICK THIS
    
    % Note: It's not going to be detrimental if you use either means_k or
    % means_k_neg regardless of your extract_keypoints function. But I
    % found the above rule helps me to find improved results.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % initialize storage for each of the three types of representations
    reprs_bow = [];
    reprs_texture_concat = [];
    reprs_texture_mean = [];
    
    % compute representations
    for i = 1:length(im_list)
        im = imread(im_list{i});  
        im = imresize(im, [300 300]);

        % YOUR CODE FROM HW 3
        [x, y, scores, Ix, Iy] = extract_keypoints(im);
        
        %%%%%%%%%%%%%%%%%%%%%% Part I CODE HERE %%%%%%%%%%%%%%%%%%%%%%
        [features] = compute_features(x, y, scores, Ix, Iy); % IMPLEMENT AND USE YOUR CODE
       
        %%%%%%%%%%%%%%%%%%%%%% Part II CODE HERE %%%%%%%%%%%%%%%%%%%%%
        repr1 = computeBOWRepr(features, means); % IMPLEMENT AND USE YOUR CODE
        
        
        [repr2, repr3] = computeTextureReprs(im, F); % provided
        
        reprs_bow = [reprs_bow; repr1];
        reprs_texture_concat = [reprs_texture_concat; repr2];
        reprs_texture_mean = [reprs_texture_mean; repr3];

    end

    % ratios for BOW with different k (number of cluster centers)
    within_dists = []; % for all images of the same animal category
    between_dists = []; % for all images NOT of the same animal category
    all_dists = zeros(length(im_list));

    for i = 1:length(im_list)
        for j = (i+1):length(im_list)
            temp = norm(reprs_bow(i, :) - reprs_bow(j, :));
            if( (mod(i, 2) == 1) && (j == i+1) )
                within_dists = [within_dists temp];
            else
                between_dists = [between_dists temp];
            end
            all_dists(i, j) = temp;
        end
    end

    r = mean(within_dists) / mean(between_dists);
    fprintf('Ratio for BOW k=%u: %f\n', k, r);
    %disp(within_dists);
    %disp(all_dists);
end

%%%%%%%%%%%%%%%%%%%%% ratio for texture concat %%%%%%%%%%%%%%%%%%%%%
within_dists = [];
between_dists = [];
all_dists = zeros(length(im_list));

for i = 1:length(im_list)
    for j = (i+1):length(im_list)
        temp = norm(reprs_texture_concat(i, :) - reprs_texture_concat(j, :));
        if( (mod(i, 2) == 1) && (j == i+1) )
            within_dists = [within_dists temp];
        else
            between_dists = [between_dists temp];
        end
        all_dists(i, j) = temp;
    end
end

r = mean(within_dists) / mean(between_dists);
fprintf('Ratio for texture concat: %f\n', r);
%disp(within_dists);
%disp(all_dists);

%%%%%%%%%%%%%%%%%%%%% ratio for texture mean %%%%%%%%%%%%%%%%%%%%%
within_dists = [];
between_dists = [];
all_dists = zeros(length(im_list));

for i = 1:length(im_list)
    for j = (i+1):length(im_list)
        temp = norm(reprs_texture_mean(i, :) - reprs_texture_mean(j, :));
        if( (mod(i, 2) == 1) && (j == i+1) )
            within_dists = [within_dists temp];
        else
            between_dists = [between_dists temp];
        end
        all_dists(i, j) = temp;
    end
end

r = mean(within_dists) / mean(between_dists);
fprintf('Ratio for texture mean: %f\n', r);
%disp(within_dists);
%disp(all_dists);
