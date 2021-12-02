clear 

image = 'fish.jpg';
im = imread(image);
edges = detectEdges(im);
origImg = im;
k = 3;

[outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k); 












