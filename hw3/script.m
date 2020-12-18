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

% maskRadius = 1;
% maskSTD = 2;
% cleanedMeanImage = cleanImageMean(im,maskSTD,maskRadius);
% imshow(cleanedMeanImage);

% maskRadius = 1;
% maskSTD = 2;
% lambda = 3;
% sharpImage = sharpen(im, maskRadius, maskSTD, lambda);
% imshow(sharpImage);

% imshow(addSPnoise(im,0.1));
% pause
% imSet = cat(3, addSPnoise(im,0.1), addSPnoise(im,0.1), addSPnoise(im,0.1));
% cleanedMedianMultiImage = cleanImageMedian_multi(imSet);
% imshow(cleanedMedianMultiImage);

% imshow(addSPnoise(im,0.1));
% pause
% imSet = cat(3, addSPnoise(im,0.1), addSPnoise(im,0.1), addSPnoise(im,0.1));
% cleanedMeanMultiImage = cleanImageMean_multi(imSet);
% imshow(cleanedMeanMultiImage);


% PSNRval = calcPSNR(addSPnoise(im,0.1), im)
% pause
% PSNRval = calcPSNR(addSPnoise(im,0.4), im)
% pause
% PSNRval = calcPSNR(im, im)
