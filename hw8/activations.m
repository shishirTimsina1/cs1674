
inputs = [10,1,2,3];
inputs(:);

weight_1 = [0.5 0.6 0.4 0.3; 0.02 0.25 0.4 0.3; 0.82 0.1 0.35 0.3];
weight_1(:);

weight_2 = [0.7 0.45 0.5; 0.17 0.9 0.8];

 
z = tanh(weight_1 * inputs(:));

disp(z(2));

y = 1/(1+exp(-(weight_2 * z)));

disp(y)
