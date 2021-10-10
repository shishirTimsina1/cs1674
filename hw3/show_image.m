clear 
% have to change file name manually
image = 'checkbox.jpg';
im = imread(image);
%extract needed variables to show corners on top of image
[x, y, scores, Ih, Iv] = extract_keypoints(im);

figure;

%add circles at the corneres detected by algorithm.
% have to modify  "...scores(i) / 50" per picture to better show circles
imshow(im)
hold on
for i =1:101
    for j =1:101
        plot(x(i),y(i),'ro','MarkerSize',scores(i) / 50);
        
    end
end
        
hold off

