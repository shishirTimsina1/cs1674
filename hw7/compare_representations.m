load hw7_data.mat

%full pyramid
pyramids_train = train_SPM_pyramid;
pyramids_test = test_SPM_pyramid;
labels_train = train_labels;

predicted_labels_pyr = findLabelsSVM(pyramids_train, labels_train, pyramids_test);
ct = 0;
for i=1:400
   if (predicted_labels_pyr(i) == test_labels(i))
       ct = ct+1;
   end
end
accr = ct/400;

%level 0
pyramids_train = train_SPM_level_0;
pyramids_test = test_SPM_level_0;

predicted_labels_0 = findLabelsSVM(pyramids_train, labels_train, pyramids_test);

ct = 0;
for i=1:400
   if (predicted_labels_0(i) == test_labels(i))
       ct = ct+1;
   end
end
accr_0= ct/400;

%level 1
pyramids_train = train_SPM_level_1;
pyramids_test = test_SPM_level_1;

predicted_labels_1 = findLabelsSVM(pyramids_train, labels_train, pyramids_test);
ct = 0;
for i=1:400
   %disp(test_labels(i));
   if (predicted_labels_1(i) == test_labels(i))
       %disp('here');
       ct = ct+1;
   end
end

accr_1 = ct/400;

