clear 

image = 'pic.jpg';
im = imread(image);
%imshow(im)
[x, y, scores, Ih, Iv] = extract_keypoints(im);

figure;
%Ix=Ih;
%Iy =Iv;

imshow(im)
hold on
[~,sz] = size(scores);

for i =1:sz
    for j =1:sz
        plot(x(i),y(i),'ro','MarkerSize',scores(i) / 5);
        
    end
end


[features] = compute_features(x, y, scores, Ih, Iv);        

hold off

