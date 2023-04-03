# BIQ2021
**A Large-Scale Blind Image Quality Assessment Database <br />**
## Overview
This repository provides BIQ2021 database of images with Mean Opinion Score (MOS) for each image. The datset is partioned into three subsets as discussed in "A Large-Scale Blind Image Quality Assessment Database". The MOS for the images is scaled to a range of 0-1 whereas the images in the database are divided into three categories  according to type of content covered by these images. Altough, the images in the database are divided in three categores but their use for training and validation doesn't distinguish an image on the basis of its content category. The name of an image contain ss01, ss02, ss03 which is for SubSet-01, SubSet-02 and SubSet-03 respectively.
### Subset-01
The first subset contains 2000 images chosen from an image gallery of images captured by Nisar Ahmed between 2007 and 2020. These images have varying degrees and types of distortions captured by various image acquisition devices. These images have distortions due to camera and photographic error, as well as distortions introduced during processing and storage. Because these images were not captured for the purpose of IQA, they can serve as a true representative for evaluating IQA algorithms. <br />
![imagename](https://github.com/nisarahmedrana/BIQ2021/blob/main/Subset-01.png)
Figure 1 Randomly selected images from subset-01
### Subset-02
The second subset contains images that were taken with the intention of being used for IQA. This subset contains 2000 images, and it ensures that the entire spectrum of quality scoring is covered by introducing images ranging from the worst to the best. The distortions in this subset were intentionally introduced during the acquisition process, similar to CID2013, but we did not use fixed levels of distortion. The images are captured by changing the International Organization for Standardization (ISO) from 50 to 3200 and the shutter speed from 4 to 1/1250 s. Auto- and manual focuses are used for acquisition, and lens blur and motion blur are introduced on purpose during acquisition. To introduce the effect of ambient light when photographing an indoor environment, the ambient light is changed. Because there are very few images with extreme distortion levels, this subset was created to balance different distortion levels. <br />
![imagename](https://github.com/nisarahmedrana/BIQ2021/blob/main/Subset-02.png)
Figure 1 Randomly selected images from subset-02
### Subset-03
The third subset of 8000 images is acquired from Unsplash.com, where use of images for scientific or commercial purposes is allowed. These downloaded images are searched for using various keywords to introduce diversity of content and are specifically chosen for the purpose of IQA. The keywords used for search are animals, wildlife, pets, birds, zoo, vegetables, fruits, food, cooking, architecture, cityscape, night, indoor, outdoor, scenery, mountain, lake, candid, close-up, experimental, texture, people, men, women, model, kids, babies, boy, girl, fashion, culture, vintage, sports, and swimming. It should be noted that many of these images have been postprocessed, making them an excellent candidate for learning the effect of postprocessing on perceptual quality. Furthermore, because it contains images with a wide range of content, this subset of images contributes to the database’s diversity. <br />
![imagename](https://github.com/nisarahmedrana/BIQ2021/blob/main/Subset-03.png)
Figure 1 Randomly selected images from subset-03
## Mean Opinion Score (MOS)
Image Quality Assessment (IQA) is performed by supplying a quality score for each image which is subsequently used for supervised training (regression). These quality scores are obtained from human subjects (observers) who rate the images on a scale from 1 to 5 in terms of "excellent", "good", "fair", "bad" and "very bad". ITU-T P.910 provide recommendation for absolute quality rating with discrete scale and state that up 30 subjects with diverse background will provide a reliable judgment. The experiments are conducted in laboratory environment under the supervision of the authors and quality ratings from 30 observers are averaged to obtain MOS.
## Train-Test Split
In order to make the benchmarking of various approaches on the BIQ2021 dataset, it is imperative to use a consistant train-test split. For this purpose, the dataset is partioned into two splits with training dataset containing 10,000 images and testing dataset containing 2,000 images. It is to be noted that validation split is not provided with the data and it is upto the user to partion a suitable portion of data for validation, if required.
### Model Evaluation
In order to evaluate the performance of an image quality assessment method on BIQ2021 dataset, Pearson's Linear Correlation Coefficient (PLCC) and Spearman's Rank Order Correlation Coefficient (SROCC) for various methods are reported. It is to be noted that the training of any of these models, if required, is performed on the training dataset and the reported results (PLCC & SROCC) for any method are obtained from testing dataset.<br/>
|Sr.|Technique/Model|PLCC|SROCC|RMSE|      
|-----|-----|-----|-----|-----|
|1|[BRISQUE](https://www.mathworks.com/help/images/ref/brisque.html)|0.6941|0.6039|0.1588|
|2|[NIQE](https://uk.mathworks.com/help/images/ref/niqemodel.html)|0.2981|0.2674|0.5402|
|3|[PIQE](https://www.mathworks.com/help/images/ref/piqe.html)|0.2088|0.1796|0.3935|
|4|[ResNet-18](https://www.mathworks.com/help/deeplearning/ref/resnet18.html)|0.0000|0.0000|0.0000|
|5|[ResNet-50](https://www.mathworks.com/help/deeplearning/ref/resnet50.html)|0.6784|0.6114|0.1434|
|6|[ResNet-101](https://www.mathworks.com/help/deeplearning/ref/resnet101.html)|0.0000|0.0000|0.0000|
|7|[MobileNet-V2](https://www.mathworks.com/help/deeplearning/ref/mobilenetv2.html)|0.0000|0.0000|0.0000|
|8|[DenseNet-201](https://www.mathworks.com/help/deeplearning/ref/densenet201.html)|0.0000|0.0000|0.0000|
|9|[Inception-ResNet-V2](https://www.mathworks.com/help/deeplearning/ref/inceptionresnetv2.html)|0.0000|0.0000|0.0000|
|10|[Xception](https://www.mathworks.com/help/deeplearning/ref/xception.html?searchHighlight=xception&s_tid=srchtitle_xception_1)|0.0000|0.0000|0.0000|
|11|[EfficientNet-b0](https://www.mathworks.com/help/deeplearning/ref/efficientnetb0.html)|0.0000|0.0000|0.0000|
|12|[NASNet-Large](https://www.mathworks.com/help/deeplearning/ref/nasnetlarge.html)|0.0000|0.0000|0.0000|
<br />

Moreover, the codes used for training a CNN model on BIQ2021 are also provided. Pre-trained model can be downloaded from MATLAB and reconfigured as explained in the paper. The trained models for classification and regression are also provided for validation or comparison. <br />

Trained Model (InceptionResNet-V2): https://www.mathworks.com/matlabcentral/fileexchange/116410-inceptionresnetv2 <br />
Trained Model (Xception): https://www.mathworks.com/matlabcentral/fileexchange/116415-pre-trained-xception-on-koniq-10k <br />
Trained Model (NASNet-Large): https://drive.google.com/file/d/1VAi6Kk5nka1ODByoB-yWgBlRw-PLyLHQ/view?usp=sharing <br />
