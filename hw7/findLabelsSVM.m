function [predicted_labels_test] = findLabelsSVM(pyramids_train, labels_train, pyramids_test);
model = fitcecoc(pyramids_train, labels_train);
label = predict(model, pyramids_test);
predicted_labels_test = label;
