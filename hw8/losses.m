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

final_loss = (ret1+ret2+ret3+ret4)/4



s1 = W2*x1;
s2 = W2*x2;
s3 = W2*x3;
s4 = W2*x4;

ret1 = hinge_loss(s1, 1);
ret2 = hinge_loss(s2, 2);
ret3 = hinge_loss(s3, 3);
ret4 = hinge_loss(s4, 4);
final_loss = (ret1+ret2+ret3+ret4)/4


s1 = W3*x1;
s2 = W3*x2;
s3 = W3*x3;
s4 = W3*x4;

ret1 = hinge_loss(s1, 1);
ret2 = hinge_loss(s2, 2);
ret3 = hinge_loss(s3, 3);
ret4 = hinge_loss(s4, 4);
final_loss = (ret1+ret2+ret3+ret4)/4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s1 = W1*x1;
s2 = W1*x2;
s3 = W1*x3;
s4 = W1*x4;

ret1 = cross_entropy_loss(s1,1);
ret2 = cross_entropy_loss(s2,2);
ret3 = cross_entropy_loss(s3,3);
ret4 = cross_entropy_loss(s4,4);
final_loss = (ret1 + ret2 + ret3 +ret4)/4


s1 = W2*x1;
s2 = W2*x2;
s3 = W2*x3;
s4 = W2*x4;

ret1 = cross_entropy_loss(s1,1);
ret2 = cross_entropy_loss(s2,2);
ret3 = cross_entropy_loss(s3,3);
ret4 = cross_entropy_loss(s4,4);
final_loss = (ret1 + ret2 + ret3 +ret4)/4


s1 = W3*x1;
s2 = W3*x2;
s3 = W3*x3;
s4 = W3*x4;

ret1 = cross_entropy_loss(s1,1);
ret2 = cross_entropy_loss(s2,2);
ret3 = cross_entropy_loss(s3,3);
ret4 = cross_entropy_loss(s4,4);
final_loss = (ret1 + ret2 + ret3 +ret4)/4





