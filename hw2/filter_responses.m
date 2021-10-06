filenames = {'cardinal1.jpg', 'cardinal2.jpg',...
            'leopard1.jpg', 'leopard2.jpg', 'panda1.jpg', 'panda2.jpg'
            }
        
[~, col] = size(filenames);
filters = makeLMfilters;
[row,sizeOfFilters] = size(filters);


for in2=1: 48
   h = filters(:,:,in2);
   
   subplot(2,4,1);
   imagesc(h);
   
   for ind=1 : col
        currFilename = filenames{ind};
        I = imread(currFilename);
        I = rgb2gray(I);
        I = imresize(I,[100 100]);
        B = imfilter(I,h);
        %figure;
        if ind == 1
            subplot(2,4,3);
            imagesc(B);
            title(currFilename)
        elseif ind == 2
            subplot(2,4,4);
            imagesc(B);
            title(currFilename)
        elseif ind == 3
            subplot(2,4,5);
            imagesc(B);
            title(currFilename)
        elseif ind == 4
            subplot(2,4,6);
            imagesc(B);
            title(currFilename)
        elseif ind == 5
            subplot(2,4,7);
            imagesc(B);
            title(currFilename)
         elseif ind == 6
            subplot(2,4,8);
            imagesc(B);
            title(currFilename)
        end
        
        saveas(gcf, strcat('responses_to_filter',num2str(in2),'.png'));
   end
    
    
end

im = imread('prague.jpg');
energyImage = energy_image(im);
imagesc(energyImage);

M = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
imagesc(M);
M2 = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
imagesc(M2);
seam = find_optimal_horizontal_seam(M);
seam2 = find_optimal_vertical_seam(M2);

displaySeam(im, seam, 'HORIZONTAL');
hold off;


displaySeam(im, seam2, 'VERTICAL');
hold off;

r = reduceWidth(im, true);
n = reduceHeight(im, true);
nn = reduceHeight(n, false);

generate_results('hybrid.png', 100, 'HEIGHT');


