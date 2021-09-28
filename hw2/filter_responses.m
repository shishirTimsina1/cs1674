filenames = {'baby_happy.jpg', 'baby_weird.jpg', 'cardinal1.jpg', 'cardinal2.jpg',...
            'leopard1.jpg', 'leopard2.jpg', 'mall.jpg', 'panda1.jpg', 'panda2.jpg',...
            'prague.jpg'
            }
        
[row, col] = size(filenames);
filters = makeLMfilters;
[row, sizeOfFilters] = size(filters);
for ind = 1 : col
    currFilename = filenames{ind};
    I = imread(currFilename);
    I = rgb2gray(I);
    I = imresize(I,[100 100]);
    for in2=1: sizeOfFilters
        
    end
    %%saveas(gcf, strcat('responses_to_filter_', num2str(ind),'.png'));
    
    %%imshow(I);
    %%pause(3);
end