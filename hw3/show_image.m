image = 'cardinal1.jpg';
im = imread(image);
[x, y, scores, Ih, Iv] = extract_keypoints(image);
%imshow(Ih);
imshow(Iv);
subplot(1,2,1);
imshow(Ih);
subplot(1,2,2);
imshow(Iv);