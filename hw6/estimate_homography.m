function H = estimate_homography(PA, PB) 
H = zeros(3);
A = [];
numRowA = size(PA,1);
numRowB = size(PB,1);
numRow = max(numRowA, numRowB);

for i = 1:numRow
    x = PA(i, 1);
    y = PA(i, 2);
    xPrime = PB(i,1);
    yPrime = PB(i,2);
    iTh = [-x -y -1 0 0 0 x*xPrime y*xPrime xPrime; 0 0 0 -x -y -1 x*yPrime y*yPrime yPrime];
    A = [A; iTh];
end

[~, ~, V] = svd(A);
h = V(:, end); 
H = reshape(h, 3, 3)';

end

