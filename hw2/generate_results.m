function [] = generate_results(filename, reduceAmt, reduceWhat)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    im = imread(filename);
    tf = strcmp('HEIGHT', reduceWhat);
    
    if tf ==1
        disp('***********HORT');
       for iter =1 :reduceAmt
           if iter == 1
               im = reduceHeight(im, true);
           end
         im = reduceHeight(im, false);
         %pause(5);
       end
       
    else
        disp('***********VERT');
        for iter= 1: reduceAmt
            if iter == 1
               im = reduceWidth(im, true);
           end
          im = reduceWidth(im, false);
        end

    end
    
    figure;
    subplot(1, 3, 1); imagesc(imread(filename)); title('original');
    subplot(1, 3, 2); imagesc(im); title('content-aware');
    if filename == 'mall.jpg'
        subplot(1,3,3); imagesc(im); title('standard');
    else
        subplot(1, 3, 3); imagesc(imresize(imread(filename), 100)); title('standard');
    end


end

