function [features] = compute_features(x, y, scores, Ix, Iy)
%COMPUTE_FEATURES Summary of this function goes here
%   Detailed explanation goes here

%set up

bin1 = 0;
bin2 = 0;
bin3 = 0;
bin4 = 0;
bin5 = 0;
bin6 = 0;
bin7 = 0;
bin8 = 0;

[rows, cols] = size(Ix);
%count =1;

%remove keypoints in boundaries
for i=1:length(x)
    if x(i)<5 || x(i)>rows-5 || y(i)>rows-5
        x(i) =0;
        y(i) =0;
        scores(i) = 0;
    elseif y(i)<5 || y(i)>cols-5 || x(i)>cols-5
        x(i) = 0;
        y(i) = 0;
        scores(i) = 0;
    end
end

features = zeros(length(x), 8);


% compute gradient and angles
x= x(x~=0);
y = y(y~=0);
scores = scores(scores~=0);
m = zeros(rows,cols);
theta = zeros(rows,cols);

for j = 1:length(x)
    xPix = x(j);
    yPix = y(j);
    for k=-5:5
        for p=-5:5
            m(yPix+p, xPix+k) = sqrt(Ix(yPix+p, xPix+k)^2 + Iy(yPix+p, xPix+k)^2);
            t = atand(Iy(yPix+p, xPix+k) / Ix(yPix+p, xPix+k));
            if m(yPix+p, xPix+k)== 0
                t=0;
            end
            if t <= -67.5
                theta(yPix+p, xPix+k) = 1;
               
            elseif t<= -45
                theta(yPix+p, xPix+k) = 2;
                
            elseif t<= -22.5
                theta(yPix+p, xPix+k) = 3;
                
            elseif t<= 0
                theta(yPix+p, xPix+k) = 4;
                
            elseif t<= 22.5
                theta(yPix+p, xPix+k) = 5;
                
            elseif t<= 45
                theta(yPix+p, xPix+k) = 6;
               
            elseif t<= 67.5
                theta(yPix+p, xPix+k) = 7;
               
            else
                theta(yPix+p, xPix+k) = 8;
               
            end
            
            imagesc(m);
     

            if theta(yPix+p, xPix+k) == 1
                bin1 = bin1 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 2
                bin2 = bin2 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 3
                bin3 = bin3 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 4
                bin4 = bin4 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 5
                bin5 = bin5 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 6
                bin6 = bin6 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 7
                bin7 = bin7 + m(yPix+p, xPix+k);
            elseif theta(yPix+p, xPix+k) == 8
                bin8 = bin8 + m(yPix+p, xPix+k);
            end
        end
    end
    
    
    bins = [bin1 bin2 bin3 bin4 bin5 bin6 bin7 bin8];
    bin=bins/sum(bins);

    for i = 1: 8
        if bin(i) >= .2
            bin(i) = .2;
        end
    end
    %bin=bins/sum(bin);

    features(j,:) = bin;

end

