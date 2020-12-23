% original image
im = imread('lena.tif');
disp("The original image ->")
imshow(im);
pause

% a)

% s&p noised image + PSNR to original
p = 0.2;
noisySNPImage = addSPnoise(im,p);
noisySNPImagePSNR = calcPSNR(noisySNPImage, im);
disp("Noised with Salt&Pepper, PSNR = "+noisySNPImagePSNR+" ->")
imshow(noisySNPImage);
pause

% mean denoising + PSNR to original
maskRadius = [1,1];
maskSTD = 2;
cleanedMeanImage = cleanImageMean(noisySNPImage,maskRadius, maskSTD);
cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
disp("Cleaned Salt&Pepper with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
imshow(cleanedMeanImage);
pause

% median denoising  + PSNR to original
maskRadius = [1,1];
cleanedMedianImage = cleanImageMedian(noisySNPImage,maskRadius);
cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
disp("Cleaned Salt&Pepper with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
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
maskRadius = [1,1];
maskSTD = 2;
cleanedMeanImage = cleanImageMean(noisyGausImage, maskRadius, maskSTD);
cleanedMeanImagePSNR = calcPSNR(cleanedMeanImage, im);
disp("Cleaned Gaussian blur with Mean, PSNR = "+cleanedMeanImagePSNR+" ->")
imshow(cleanedMeanImage);
pause

% median denoising  + PSNR to original
maskRadius = [1,1];
cleanedMedianImage = cleanImageMedian(noisyGausImage,maskRadius);
cleanedMedianImagePSNR = calcPSNR(cleanedMedianImage, im);
disp("Cleaned Gaussian blur with Median, PSNR = "+cleanedMedianImagePSNR+" ->")
imshow(cleanedMedianImage);
pause

% c)

% conclusions regarding filtering efficiency

disp("-----------------------------------------------------")
disp("Conclusions regarding filtering efficiency:")
disp("-----------------------------------------------------")
disp("Salt&Pepper is best cleaned with median filtering, due to the noise's peaky nature")
disp("which gets completely filtered when selecting the median value per window")
disp("Gaussian blur is best cleaned with mean filtering")
disp("in this case the advantage is not as visible as with median on S&P,")
disp("nevertheless - the normaly distributed noise gets cleaned better with a normaly distributed filter")
disp("-----------------------------------------------------")
disp("Press enter to continue (may take a few seconds)")
pause

% d)

% plot maskRadius - PSNR (Salt&Pepper noise, median filtering)

cleanedMedianImagePSNRs = [];
for radius=1:20
    maskRadius = [radius,radius];
    p = 0.4;
    noisySNPImage = addGaussianNoise(im,p);
    cleanedMedianImage = cleanImageMedian(noisySNPImage,maskRadius);
    cleanedMedianImagePSNRs(end+1) = calcPSNR(cleanedMedianImage, im);
end
plot(1:20,cleanedMedianImagePSNRs);
disp('maskRadius - PSNR (Salt&Pepper noise, median filtering) ->')
title('maskRadius - PSNR (Salt&Pepper noise, median filtering)')
xlabel('maskRadius') 
ylabel('PSNR') 
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('We can clearly see a drop in PSNR as mask size increases')
disp('This is a result of allowing more distant pixels to influence the value of a given pixel')
disp('Making it more likely for the selected value to be generic rather then reflect source image')
pause

% e)

% plot maskSTD - PSNR (Gaussian blur noise, mean filtering)

cleanedMeanImagePSNRs = [];
for maskSTD=1:30
    s = 0.5;
    maskRadius = [3,3];
    noisyGaussImage = addGaussianNoise(im,s);
    cleanedMeanImage = cleanImageMean(noisyGaussImage,maskRadius, maskSTD/5);
    cleanedMeanImagePSNRs(end+1) = calcPSNR(cleanedMeanImage, im);
end
plot(1:30,cleanedMeanImagePSNRs);
disp('maskSTD - PSNR (Gaussian blur noise, mean filtering) ->')
title('maskSTD - PSNR (Gaussian blur noise, mean filtering)')
xlabel('maskSTD') 
ylabel('PSNR')
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('We can clearly see a raise in PSNR as STD increases and then a convergence')
disp('This could be explained by the spreading of the gaussian influence')
disp('from a nerrow area to broad one - at first the inluence is good as we get a cleaner image')
disp('but as the gaussian grows large the effect comes to a limit')
pause

% f)

% build the Gaussian noise image set

setSize = 10;
noiseType = 2; % == Gaussian noise
noiseFactor = 0.1; % == p
imSet_GaussianNoise = BuildImageSet(im, setSize, noiseType, noiseFactor);

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
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('The bigger the image set - the better the results are for both cases')
disp('as both the meddian gets picked and the avareged value are closer to source image')
disp('both give reletevely good, and similiar results (PSNR wise)')
disp('the median filtering, which is generally less effective with gaussian noise')
disp('gives artifacts around edges, which is expected due to median selection being of less continueus nature')
pause

% g)

% build the Salt&Pepper noise image set

setSize = 10;
noiseType = 1; % == Salt&Pepper noise
noiseFactor = 0.1; % == s
imSet_SaltNPepperNoise = BuildImageSet(im, setSize, noiseType, noiseFactor);

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
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('Like examples before - for S&P noise we get better results with median filtering')
disp('For the lena image we got PSNR=inf which indicates high similiarity')
disp('However - we do observe some of the mentioned artifacts for median filtering even in that case.')
pause

% h)

% plot frames - PSNR (Salt&Pepper noise, median multi filtering)

cleanedSNPImagePSNRs = [];
for numFrames=1:10
    
    imSet_SaltNPepperNoise = BuildImageSet(im, numFrames, 1, 0.1);
    cleanedMedianMultiImage = cleanImageMedian_multi(imSet_SaltNPepperNoise);
    cleanedSNPImagePSNRs(end+1) = calcPSNR(cleanedMedianMultiImage, im);
end
plot(1:10,cleanedSNPImagePSNRs);
disp("frames - PSNR (Salt&Pepper noise, median multi filtering)")
title('frames - PSNR (Salt&Pepper noise, median multi filtering)')
xlabel('frames') 
ylabel('PSNR')
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('We are seeing a zig-zag raise in PSNR when frames are added')
disp('This is expacted as median filtering on Salt&Pepper noise is effective as we have shown thus far')
disp('The zig-zag effect of the graph can be explained by randomness and discreatness of the dots')
disp('In some picture, more corresponding (parralel) pixels were noised then others, causing the median')
disp('selected to still be black or white and thus the local PSNR drop.')
pause

% i)

cleanedGaussianImagePSNRs = [];

% plot frames - PSNR (Gaussian blur noise, mean multi filtering)
for numFrames=1:10
    
    imSet_GaussianNoise = BuildImageSet(im, numFrames, 2, 0.1);
    cleanedMeanMultiImage = cleanImageMean_multi(imSet_GaussianNoise);
    cleanedGaussianImagePSNRs(end+1) = calcPSNR(cleanedMeanMultiImage, im);
end
plot(1:10,cleanedGaussianImagePSNRs);
disp("frames - PSNR (Gaussian blur noise, mean multi filtering)")
title('frames - PSNR (Gaussian blur noise, mean multi filtering)')
xlabel('frames') 
ylabel('PSNR')
disp("-----------------------------------------------------")
disp("Explanation:")
disp("-----------------------------------------------------")
disp('We are seeing a continueues raise in PSNR when frames are added')
disp('This is expacted as mean filtering on gaussian blur is effective as we have shown thus far')
disp('And the smoovness of the graph can be explained by the natural continues quality of the gaussian')
pause

% j)

% simple blur -> sharpen example

K=2;
blurred_im = uint8(conv2(im, ones(K,K).*1/(K^2)));
maskRadius = [1,1];
maskSTD = 2;
lambda = 3;
sharpen_im = sharpen(blurred_im, maskRadius, maskSTD, lambda);
disp("blurred image first example (k=2) ->")
imshow(blurred_im);
pause
disp("sharpened image first example (lambda=3) ->")
imshow(sharpen_im);
pause

% gibbs effect blur -> sharpen example

K=2;
blurred_im = uint8(conv2(im, ones(K,K).*1/(K^2)));
maskRadius = [1,1];
maskSTD = 2;
lambda = 6;
sharpen_im = sharpen(blurred_im, maskRadius, maskSTD, lambda);
disp("blurred image gibbs example (k=2) ->")
imshow(blurred_im);
pause
disp("sharpened image gibbs example (lambda=6) ->")
imshow(sharpen_im);
pause

% conclusions and example supporting claim

disp("-----------------------------------------------------")
disp("Explanation - lambda_0 to K test:")
disp("-----------------------------------------------------")
disp("Results indicate that lambda_0 does increase with K")
disp("for instance gibbs is very visible for K=2, lambda=6")
disp("but not so much with k=6, lambda=6 -> ")

K=6;
blurred_im = uint8(conv2(im, ones(K,K).*1/(K^2)));
maskRadius = [1,1];
maskSTD = 2;
lambda = 6;
sharpen_im = sharpen(blurred_im, maskRadius, maskSTD, lambda);
imshow(sharpen_im);
pause

% k)

% sharpen Salt&Pepper noised image example

p = 0.05;
noisySNPImage = addSPnoise(im,p);
disp("S&P noised image (p=0.05) ->")
imshow(noisySNPImage);
pause

maskRadius = [1,1];
maskSTD = 2;
lambda = 10;
sharpen_im = sharpen(noisySNPImage, maskRadius, maskSTD, lambda);
disp("sharpenned  S&P noised image (lambda=6) ->")
imshow(blurred_im);
disp("-----------------------------------------------------")
disp("Explenation:")
disp("-----------------------------------------------------")
disp("when you sharpen an image that has S&P noise")
disp("you get a blurred result regardless of the lambda selected")
disp("that is expacted due to the gaussian mask involved with the sharpening")
disp("averaging the black & white dots to the other pixels thus creating the blur effect")
disp("-----------------------------------------------------")
pause

disp("The End.")
