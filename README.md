# BIQ2021
A Large-Scale Blind Image Quality Assessment Database
This repository provides BIQ2021 database of images with Mean Opinion Score (MOS) and standard deviation for each image. Moreover, the class labels indicating image quality is also provided to train a classification algorithm. The details of the experiments can be accessed from the "A Large-Scale Blind Image Quality Assessment Database" paper or the research blog.

The subjective experiments are conducted using a Matlab (R) 2020b app. The app can be placed in the images folder and the scoring can be started by initializing the image number. The participant of the subjective experiment need to select an image quality among the five labels "excellent", "good", "fair", "bad" and "very bad".

Moreover, the codes used for training a CNN model on BIQ2021 are also provided. Pre-trained model can be downloaded from MATLAB and reconfigured as explained in the paper. The trained models for classification and regression are also provided for validation or comparison.
Trained Model (InceptionResNet-V2): https://www.mathworks.com/matlabcentral/fileexchange/116410-inceptionresnetv2
Trained Model (Xception): https://www.mathworks.com/matlabcentral/fileexchange/116415-pre-trained-xception-on-koniq-10k
