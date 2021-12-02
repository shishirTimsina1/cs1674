function [energyImage, Ix, Iy] = energy_image(im)
%UNTITLED compute the energy at each pixel using 
%   the magnitude of the x and y gradients.
    im = rgb2gray(im);
    Ix = [1,0,-1];
    Iy = [1; 0; -1];
    
    im_gray_x = imfilter(im, Ix);
    im_gray_y = imfilter(im, Iy);
    im_gray_x = im2double(im_gray_x);
    im_gray_y = im2double(im_gray_y)
    
    energyImage = sqrt((im_gray_x.^2) + (im_gray_y.^2));
    energyImage = double(energyImage);
end