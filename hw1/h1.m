format compact
%Matrices and Vectors
%1) generate 1000000 x 1 vector of random numbers, mean of 0 and sd of 5.
%using randn
disp("Problem 1")
sd = 5;
mn = 0;
r = sd.*randn([1000000,1]) + mn;
s = r(:,:);

%2) add 1 to every value to the previous list using a loop, time the
%operation and print to code as well as in answers.txt
disp("Problem 2")
iterationsARR = size(s);
iterations = iterationsARR(1);

tic;
    for a = 1:iterations
        s(a) = s(a) + 1;
    end
disp(toc)

%3 add 1 to original vector, without loop. time and print in a different
%way.
disp("Problem 3")
tic
    r = r + 1;
toc



%4 PLOT 2^x, x values are positve, even and less than 100
disp("Problem 4")
x = [0:2:99];
y = 2.^x;
plot(x, y)

%5 matrix A and B, such that A + B creates a vector 1 through 100
disp("Problem 5")
A = [1:10:91; 2:10:92; 3:10:93; 4:10:94; 5:10:95; 6:10:96; 7:10:97; 8:10:98; 9:10:99; 10:10:100];
B = zeros(10,10);

C = A + B;

%Loops allowed

%6 print values 1 to 10 in random order, with pauses of 1 sec betweeen each
%two prints
disp("Problem 6")
array = [1:10];
index = array(randperm(length(array)));
for a = 1:10

    if mod(a,2) == 1
        pause(1);
    end
    disp(index(a))
end

%7 Matrices A and B, randomly populated, find product
disp("Problem 7")
A = rand(5,3)
B = rand(3,5)

C = A * B;

for row = 1:5
    for col = 1:5
        s = 0;
        for i = 1:3
            s = s + A(row,i) * B(i,col);
        end
        results(row, col) = s;
    end
end



%Functions

%8 normalize rows
disp("Problem 8")

A = randi(5,3);
retMatrix = normalize_rows(A)

%9 normalize colums
disp("Problem 9")

A = randi(5,3);
retMatrix = normalize_columns(A)

%10 fibonacci
disp("Problem 10")

%myfib = fib(9);
disp(myfib)
disp("fibonacci of given input")

%11
%remove a duplicate row from the given matrix
disp("Problem 11")

% A has a duplicate row at row 3, output should remove that row
A = [1,1,1; 2,2,2; 1,1,1; 3,3,3]
N = my_unique(A);
N

%Images

%12 get image
disp("Problem 12")
I = imread('pittsburgh.png');
[rows, columns, numberOfColorChannels] = size(I);

%13 gray convert
disp("Problem 13")
grayImage = im2gray(I);
imshow(grayImage)


%14 find how many pixels equal 6
disp("Problem 14")

result = (grayImage(:) == 6);
ad = sum(result(:))
disp("instances of 6")

%15 darkest pixel
disp("Problem 15")
[M, I] = min(grayImage(:));
[row, col] = ind2sub(size(grayImage),I)

%16 put a 31x31 square of white pixels over that previous dark pixel
disp("Problem 16")
int = grayImage(row ,col)

start_row = row -15
start_col = col -15
end_row = row + 15
end_col = col + 15

for i=start_row:end_row
    for j=start_col:end_col
        grayImage(i,j) = 255;
    end
end

imshow(grayImage)

%17 turn that 31x31 white box into 121x121 gray box, centered at the same
%pixel

disp("Problem 17")
start_row = row -60
start_col = col -60

grayImage(start_row:row+60, start_col:col+60) =150;
imshow(grayImage)

%18 make new figure with all square visible, save to new_image.png
disp("Problem 18")
start_row = row-15
start_col = col-15
grayImage(start_row:row+15, start_col:col+15) =255;

figure
imshow(grayImage)
saveas(gcf, 'new_image.png')

%19 average pixel stuff
disp("Problem 19")

I = imread('pittsburgh.png');

rChannel = I(:,:,1);
gChannel = I(:,:,2);
bChannel = I(:,:,3);
gray = rgb2gray(I);
x = gray==0;

rAvg = uint8(mean(rChannel(~x)));
gAvg = uint8(mean(gChannel(~x)));
bAvg = uint8(mean(bChannel(~x)));

rChannel = rChannel - rAvg;
gChannel = gChannel - gAvg;
bChannel = bChannel - bAvg;

Iout = cat(3,rChannel,gChannel,bChannel);
figure
imshow(Iout)
saveas(gcf,'mean_sub.png')




    