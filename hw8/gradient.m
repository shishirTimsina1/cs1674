%size(W1(:))

s1 = W1*x1
s2 = W1*x2;
s3 = W1*x3;
s4 = W1*x4;

scores = s1;
correct_class = 1;
ret1 = hinge_loss(s1, 1);
ret2 = hinge_loss(s2, 2);
ret3 = hinge_loss(s3, 3);
ret4 = hinge_loss(s4, 4);

loss = (ret1+ret2+ret3+ret4)/4
h = 0.0001
GradW1 = W1(:);
GradW1(1:100) = 0;
for i = 1 : 100
    W1 = W1(:);
    temp = W1(i);
    W1(i) = W1(i) + h;
    W1 = reshape(W1,[4,25])
    s1 = W1*x1;
    s2 = W1*x2;
    s3 = W1*x3;
    s4 = W1*x4;
    ret1 = hinge_loss(s1, 1);
    ret2 = hinge_loss(s2, 2);
    ret3 = hinge_loss(s3, 3);
    ret4 = hinge_loss(s4, 4);

    loss2 = (ret1+ret2+ret3+ret4)/4;
    
    GradW1(i) = (loss2 - loss)/ 0.0001;
    W1(i) = temp;
end

