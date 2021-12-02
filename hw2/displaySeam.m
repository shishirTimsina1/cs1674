function displaySeam(im, seam, seamDirection)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    tf = strcmp('HORIZONTAL', seamDirection);
   
    figure;
    if tf == 1
        %disp('****************hort');
        imshow(im);
        hold on;
        plot([1:640], seam(1:640),'r');
    else
        %disp('******************vert');
        imshow(im);
        hold on;
         plot(seam(1:480),[1:480] ,'r');
        
    end
end

