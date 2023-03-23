# BIQ2021
**A Large-Scale Blind Image Quality Assessment Database <br />**

This repository provides BIQ2021 database of images with Mean Opinion Score (MOS) for each image. The datset is partioned into three subsets as discussed in "A Large-Scale Blind Image Quality Assessment Database". The MOS for each of these subsets is provided in CSV file named with each of these subsets. The images in each subset are named sequentially starting from 1 whereas the CSV file of same subset provide MOS for each image number.
The database contains three image subsets, each of which serves the purpose of providing a diverse set of images. The first subset contains 2000 images chosen from an image gallery of images captured by N. Ahmed between 2007 and 2020. These images have varying degrees and types of distortions captured by various image acquisition devices. These images have distortions due to camera and photographic error, as well as distortions introduced during processing and storage. Because these images were not captured for the purpose of IQA, they can serve as a true representative for evaluating IQA algorithms. Figure 1 shows some randomly selected images from the BIQ2021 database’s subset-1. 

The second subset contains images that were taken with the intention of being used for IQA. This subset contains 2000 images, and it ensures that the entire spectrum of quality scoring is covered by introducing images ranging from the worst to the best. The distortions in this subset were intentionally introduced during the acquisition process, similar to CID2013, but we did not use fixed levels of distortion. The images are captured by changing the International Organization for Standardization (ISO) from 50 to 3200 and the shutter speed from 4 to 1/1250 s. Auto- and manual focuses are used for acquisition, and lens blur and motion blur are introduced on purpose during acquisition. To introduce the effect of ambient light when photographing an indoor environment, the ambient light is changed. Because there are very few images with extreme distortion levels, this subset was created to balance different distortion levels. Figure 2 shows images from the BIQ2021 database’s
subset-2.

The third subset of 8000 images is acquired from Unsplash.com, where use of images for scientific or commercial purposes is allowed. These downloaded images are searched for using various keywords to introduce diversity of content and are specifically chosen for the purpose of IQA. The keywords used for search are animals, wildlife, pets, birds, zoo, vegetables, fruits, food, cooking, architecture, cityscape, night, indoor, outdoor, scenery, mountain, lake, candid, close-up, experimental, texture, people, men, women, model, kids, babies, boy, girl, fashion, culture, vintage, sports, and swimming. It should be noted that many of these images have been postprocessed, making them an excellent candidate for learning the effect of postprocessing on perceptual quality. Furthermore, because it contains images with a wide range of content, this
subset of images contributes to the database’s diversity. Figure 3 shows some selected images from this category.



The subjective experiments are conducted using a Matlab (R) 2020b app. The app can be placed in the images folder and the scoring can be started by initializing the image number. The participant of the subjective experiment need to select an image quality among the five labels "excellent", "good", "fair", "bad" and "very bad".

Moreover, the codes used for training a CNN model on BIQ2021 are also provided. Pre-trained model can be downloaded from MATLAB and reconfigured as explained in the paper. The trained models for classification and regression are also provided for validation or comparison. <br />

Trained Model (InceptionResNet-V2): https://www.mathworks.com/matlabcentral/fileexchange/116410-inceptionresnetv2 <br />
Trained Model (Xception): https://www.mathworks.com/matlabcentral/fileexchange/116415-pre-trained-xception-on-koniq-10k <br />
Trained Model (NASNet-Large): https://drive.google.com/file/d/1VAi6Kk5nka1ODByoB-yWgBlRw-PLyLHQ/view?usp=sharing <br />
