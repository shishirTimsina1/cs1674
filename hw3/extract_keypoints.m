function [x, y, scores, Ih, Iv] = extract_keypoints(image)

%set up and preprocessing
k = 0.05;
window_size = 5;
thres = 10000000;
x = [];
y = [];
scores = [];

im = rgb2gray(image);
im = im2double(im);


num_rows = size(im, 1);
num_cols = size(im, 2);

R = zeros([num_rows num_cols]);

%Gradients
h1 = [-1 0 1;-1 0 1;-1 0 1];
h2 = [-1 0 1; -1 0 1; -1 0 1]';
Ih = imfilter(im, h1);
Iv = imfilter(im, h2);

Ih2 = Ih.^2;
Iv2 = Iv.^2;
Ixy = Ih.*Iv;


%computing Matrix and R
for i = 3:num_rows-3
    for j = 3:num_cols-3
        pixel = 1;
        for n =1:window_size
            for z =1:window_size
                X(pixel) = Ih2(i-3+n,j-3+z);
                Y(pixel) = Iv2(i-3+n, j-3+z);
                XY(pixel) = Ixy(i-3+n, j-3+z);
                pixel= pixel+1;
            end
        end
        M = [sum(X), sum(XY); sum(XY),sum(Y)];
        R(i,j) = det(M) - k*(trace(M)).^2;    
    end
end
%threshold r and remove unwanted values
Rvect = R(:);
r_sort = sort(Rvect);
[s,~] = size(Rvect);
thres = r_sort(s-100);

R(R < thres) = 0;
imagesc(R);
num_rows = size(R, 1);
num_cols = size(R, 2);

%create x and y and scores vectors
for i=1: num_rows
    for j = 1:num_cols
        ind = 1;
        if R(i,j) > 0
            x = [x,j];
            y = [y,i];
            scores = [scores,R(i,j)];
            ind=ind+1;
        end
    end
end


end

