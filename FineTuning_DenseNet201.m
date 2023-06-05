% Load annotations
train=readtable('Train (Images and MOS).csv');
test=readtable('Test (Images and MOS).csv');

% Save image names in a cell array
imagesTrain=table2cell(train(:,1));
imagesTest=table2cell(test(:,1));

% Save mos in a numeric array
mosTrain=rescale(table2array(train(:,2)));
mosTest=rescale(table2array(test(:,2)));


% Provide path to Images directory
for i=1:10000
imgsTrain(i)=strcat('C:/Users/The Psychographer/Downloads/BIQ2021-main/BIQ2021-main/Images/',imagesTrain(i));
end

for i=1:2000
imgsTest(i)=strcat('C:/Users/The Psychographer/Downloads/BIQ2021-main/BIQ2021-main/Images/',imagesTest(i));
end

delete i

% Create Datastore
imdsTrain=table(imgsTrain',mosTrain);
imdsTest=table(imgsTest',mosTest);

% load Pre-trained model
dense=densenet201;

%Analyze Network
analyzeNetwork(net);

% Display all the layers
layers = dense.Layers

% Modify the model from classification network to regression
lgraph=deepNetworkDesigner(dense);

% % Converting classification model to regression model
% numResponses = 1;
% layers = [
%     layers(1:174)
%     fullyConnectedLayer(numResponses)
%     regressionLayer];
% 
% % Construct layer graph to use for training
% lgraph=layerGraph(layers)

% Check for correct connection
analyzeNetwork(lgraph);

% Decide the Layers you want to freeze, we are not freezing any
%layers(1:174) = freezeWeights(layers(1:174));

% Get the input image size
imagesize= lgraph.Layers(1).InputSize(1:2)

% Initialize Image data augmenter
imageAugmenter = imageDataAugmenter('RandXReflection',true,'RandRotation',[-5 5]);

% Augment training and validation images
augimdsTrain = augmentedImageDatastore(imageSize,imdsTrain,'DataAugmentation',imageAugmenter,'OutputSizeMode','randcrop');
augimdsValidation = augmentedImageDatastore(imageSize,imdsTest,'OutputSizeMode','randcrop');

% Seting Training Hyperparameters
options = trainingOptions('adam', ...
    'MiniBatchSize',8, ...
    'MaxEpochs',100, ...
    'InitialLearnRate',5e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsTest, ...
    'ValidationFrequency',1250, ...
    'ValidationPatience',3,...
    'ExecutionEnvironment','gpu',...
    'Plots','training-progress', 'CheckpointPath','C:\Temp\checkpoint');

% Train the CNN model
netTransfer_DenseNet201 = trainNetwork(augimdsTrain,lgraph,options);

% Save trained model
save TrainedModelBIQ2021_DenseNet201

%Make predictions for 10 random patches for testing data
predictions_DenseNet201=[];
for i=1:10
p=predict(netTransfer_DenseNet201,augimdsTest);
predictions_DenseNet201=[predictions_DenseNet201 p];
end

% Take an average of predictions and save in Excel file
predictions_DenseNet201_BIQ2021Test=mean(predictions_DenseNet201,2);
writematrix(predictions_DenseNet201_BIQ2021Test,'predictions_DenseNet201_BIQ2021Test.xls')