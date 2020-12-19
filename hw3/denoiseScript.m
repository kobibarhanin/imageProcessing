% original image
im = imread('lena.tif');
% disp("The original image ->")
% imshow(im);
% pause

% % a)
% 
% % s&p noised image + PSNR to original
% p = 0.05;
% noisySNPImage = addSPnoise(im,p);
% noisySNPImagePSNR = calcPSNR(noisySNPImage, im);
% disp("Noised with Salt&Pepper, PSNR = "+noisySNPImagePSNR+" ->")
% imshow(noisySNPImage);
% pause
% 
% % mean denoising + PSNR to original
% maskRadius = 1;
% maskSTD = 2;
% cleanedMeanImage = cleanImageMean(noisySNPImage,maskSTD,maskRadius);
% cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
% disp("Cleaned with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
% imshow(cleanedMeanImage);
% pause
% 
% % median denoising  + PSNR to original
% maskRadius = 1;
% cleanedMedianImage = cleanImageMedian(noisySNPImage,maskRadius);
% cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
% disp("Cleaned with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
% imshow(cleanedMedianImage);
% pause
% 
% % b)
% 
% % gaussian noised image + PSNR to original
% s = 0.2;
% noisyGausImage = addGaussianNoise(im,s);
% noisyGausImagePSNR = calcPSNR(noisyGausImage, im);
% disp("Noised with Gaussian blur, PSNR = "+noisyGausImagePSNR+" ->")
% imshow(noisyGausImage);
% pause
% 
% % mean denoising + PSNR to original
% maskRadius = 1;
% maskSTD = 2;
% cleanedMeanImage = cleanImageMean(noisyGausImage,maskSTD,maskRadius);
% cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
% disp("Cleaned with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
% imshow(cleanedMeanImage);
% pause
% 
% % median denoising  + PSNR to original
% maskRadius = 1;
% cleanedMedianImage = cleanImageMedian(noisyGausImage,maskRadius);
% cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
% disp("Cleaned with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
% imshow(cleanedMedianImage);
% pause
% 
% % c)
% % conclusions regarding filtering efficiency
% disp("Salt&Pepper is cleaned best with median, Gaussian blur is cleaned best with mean")

% % d)
% % PSNR - median (Salt&Pepper)
% cleanedMedianImagePSNRs = [];
% for maskRadius=1:10
%     p = 0.4;
%     noisySNPImage = addGaussianNoise(im,p);
%     cleanedMedianImage = cleanImageMedian(noisySNPImage,maskRadius);
%     cleanedMedianImagePSNRs(end+1) = calcPSNR(cleanedMedianImage, im);
% %     imshow(cleanedMedianImage);
% %     pause
% end
% plot(1:10,cleanedMedianImagePSNRs);

% % e)
% % PSNR - mean (Gaussian blur)
% cleanedMeanImagePSNRs = [];
% for maskSTD=1:10
%     s = 0.6;
%     maskRadius = 7;
%     noisyGaussImage = addGaussianNoise(im,s);
%     cleanedMeanImage = cleanImageMean(noisyGaussImage,maskSTD,maskRadius);
%     cleanedMeanImagePSNRs(end+1) = calcPSNR(cleanedMeanImage, im);
% %     imshow(cleanedMedianImage);
% %     pause
% end
% plot(1:10,cleanedMeanImagePSNRs);

% f)
% build the Gaussian noise image set
imSet_GaussianNoise = cat(3, addGaussianNoise(im,0.1), addGaussianNoise(im,0.1), addGaussianNoise(im,0.1));

% clean with mean multi image
cleanedMeanMultiImage = cleanImageMean_multi(imSet_GaussianNoise);
cleanedMeanMultiImagePSNR = calcPSNR(cleanedMeanMultiImage, im);
disp("Cleaned Gaussian noise with Mean Multi image, PSNR = "+cleanedMeanMultiImagePSNR+" ->")
imshow(cleanedMeanMultiImage);
pause

% clean with median multi image
cleanedMedianMultiImage = cleanImageMedian_multi(imSet_GaussianNoise);
cleanedMedianMultiImagePSNR = calcPSNR(cleanedMedianMultiImage, im);
disp("Cleaned Gaussian noise with Median Multi image, PSNR = "+cleanedMedianMultiImagePSNR+" ->")
imshow(cleanedMedianMultiImage);
pause

% g)
% build the Salt&Pepper noise image set
imSet_SaltNPepperNoise = cat(3, addSPnoise(im,0.1), addSPnoise(im,0.1), addSPnoise(im,0.1));

% clean with mean multi image
cleanedMeanMultiImage = cleanImageMean_multi(imSet_SaltNPepperNoise);
cleanedMeanMultiImagePSNR = calcPSNR(cleanedMeanMultiImage, im);
disp("Cleaned Salt&Pepper noise with Mean Multi image, PSNR = "+cleanedMeanMultiImagePSNR+" ->")
imshow(cleanedMeanMultiImage);
pause

% clean with median multi image
cleanedMedianMultiImage = cleanImageMedian_multi(imSet_SaltNPepperNoise);
cleanedMedianMultiImagePSNR = calcPSNR(cleanedMedianMultiImage, im);
disp("Cleaned Salt&Pepper noise with Median Multi image, PSNR = "+cleanedMedianMultiImagePSNR+" ->")
imshow(cleanedMedianMultiImage);
pause