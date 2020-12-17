im = imread('lena.tif');

% p = 0.05;
% noisySNPImage = addSPnoise(im,p);
% imshow(noisySNPImage);

% s = 0.2;
% noisyGAUSImage = addGaussianNoise(im,s);
% imshow(noisyGAUSImage);

% t = 40;
% noisyMotionImage = addMotionBlur(im,t);
% imshow(noisyMotionImage);

% maskRadius = 3;
% cleanedMedianImage = cleanImageMedian(im,maskRadius);
% imshow(cleanedMedianImage);


maskRadius = 1;
maskSTD = 2;
cleanedMeanImage = cleanImageMean(im,maskSTD,maskRadius);
imshow(cleanedMeanImage);


