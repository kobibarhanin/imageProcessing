% original image
im = imread('lena.tif');
disp("The original image ->")
imshow(im);
pause


% a)

% s&p noised image + PSNR to original
p = 0.05;
noisySNPImage = addSPnoise(im,p);
noisySNPImagePSNR = calcPSNR(noisySNPImage, im);
disp("Noised with Salt&Pepper, PSNR = "+noisySNPImagePSNR+" ->")
imshow(noisySNPImage);
pause

% mean denoising + PSNR to original
maskRadius = 1;
maskSTD = 2;
cleanedMeanImage = cleanImageMean(noisySNPImage,maskSTD,maskRadius);
cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
disp("Cleaned with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
imshow(cleanedMeanImage);
pause

% median denoising  + PSNR to original
maskRadius = 1;
cleanedMedianImage = cleanImageMedian(noisySNPImage,maskRadius);
cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
disp("Cleaned with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
imshow(cleanedMedianImage);
pause

% b)

% gaussian noised image + PSNR to original
s = 0.2;
noisyGausImage = addGaussianNoise(im,s);
noisyGausImagePSNR = calcPSNR(noisyGausImage, im);
disp("Noised with Gaussian blur, PSNR = "+noisyGausImagePSNR+" ->")
imshow(noisyGausImage);
pause

% mean denoising + PSNR to original
maskRadius = 1;
maskSTD = 2;
cleanedMeanImage = cleanImageMean(noisyGausImage,maskSTD,maskRadius);
cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
disp("Cleaned with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
imshow(cleanedMeanImage);
pause

% median denoising  + PSNR to original
maskRadius = 1;
cleanedMedianImage = cleanImageMedian(noisyGausImage,maskRadius);
cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
disp("Cleaned with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
imshow(cleanedMedianImage);
pause

% c)
% conclusions regarding filtering efficiency
disp("bla bla...")

% d)

