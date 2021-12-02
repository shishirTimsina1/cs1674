function [p2] = apply_homography(p1, H)

p1(3) = 1;
p = H * p1';

x = p(1)/p(3);
y = p(2)/p(3);
x = ceil(x);
y = ceil(y);

p2 = [x,y];

end

