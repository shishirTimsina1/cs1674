function [predicted_labels_test] = findLabelsKNN(pyramids_train, labels_train, pyramids_test, k);
% [D,I] = pdist2(x,y,DISTANCE, 'smallest, k)

[D,I] = pdist2(pyramids_train, pyramids_test, 'euclidean', 'Smallest',k);

predicted_labels_test = mode(I)';

