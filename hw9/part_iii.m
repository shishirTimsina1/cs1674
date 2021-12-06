net = alexnet;
%analyzeNetwork(net)
layersTransfer = net.Layers(1:end-3);


digitDatasetPath = fullfile('C:\Users\shish\Desktop\cs1674\Homeworks\hw9');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainingFiles = 100;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');
layers = [ ...
    layersTransfer
    fullyConnectedLayer(8)
    softmaxLayer
    classificationLayer];
options = trainingOptions('sgdm', ...
    'MaxEpochs',1,...
    'InitialLearnRate',1e-4, ...
    'Verbose',false, ...
    'Plots','training-progress');


net = trainNetwork(imdsTrain,layers,options);

inputSize = net.Layers(1).InputSize
YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest)