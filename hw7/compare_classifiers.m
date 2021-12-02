load hw7_data.mat




%full pyramid
pyramids_train = train_SPM_pyramid;
pyramids_test = test_SPM_pyramid;
labels_train = train_labels;

predicted_labels_pyr = findLabelsSVM(pyramids_train, labels_train, pyramids_test);
ct = 0;
for i=1:400
   %disp(test_labels(i));
   if (predicted_labels_pyr(i) == test_labels(i))
       %disp('here');
       ct = ct+1;
   end
end

accr = ct/400;

%k =1
k = 1;
predicted_labels_k1 = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k);
ct =0;
if(predicted_labels_k1 == labels_train(i))
    ct = ct+1;
end
accr_k1 = ct/400;

%k=2
k = 2;
predicted_labels_k2 = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k);
ct = 0;
for i=1:400
   if (predicted_labels_k2(i) == test_labels(i))
       ct = ct+1;
   end
end

accr_k2 = ct/400;

%k = 21
k=21;
predicted_labels_k21 = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k);
ct = 0;
for i=1:400
   if (predicted_labels_k21(i) == test_labels(i))
       ct = ct+1;
   end
end

accr_k21 = ct/400;

y = accr;
y2 = accr_k1;
y3 = accr_k2;
y4 = accr_k21;
x = linspace(1,25);
plot(x,y*ones(size(x)));
hold on


plot(x, y2*ones(size(x)));
plot(x,y3*ones(size(x)))
plot(x,y4*ones(size(x)));
xlabel('k values');
ylabel('accuracy');
legend( 'SVM', 'K1','K2','K21');













