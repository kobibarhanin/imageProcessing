
% Demos for reference:
% 1. IP07_FourierTransformPart3_16_12_2020, 01:30:00
% 2. IP10_FreqProcessingPart1_28_12_2020, 00:37:50 - image enhancement at
% freq domain

% % =======================================================================

% % windmill 
% % ===========
% 
% % load tampered image
% % -----------
% im = imread('windmill.tif');
% disp("The original image ->")
% putImage(im);
% pause
% 
% % apply fixes
% % -----------
% % to fourier
% fftim = fft2(im);
% ffs = fftshift(fftim);
% ffl = uint8(log(abs(ffs)+1));
% 
% % % show fourier transform image
% % putImage(ffl);
% % imagesc([-64,63],[-64,63],ffl);
% % pause
% 
% ffs(125,101) = 0;
% ffs(133,157) = 0;
% iffs = ifft2(fftshift(ffs));
% 
% % show fixed
% % -----------
% putImage(iffs);
% 
% % explain
% % -----------
% disp("canceled (by zeroising the value) of fourier coeeficients causing the interference");
% pause

% % =======================================================================

% % USAflag 
% % ===========
% 
% % load tampered image
% % -----------
% im = imread('USAflag.tif');
% disp("The original image ->")
% putImage(im);
% pause
% 
% % apply fixes
% % -----------
% maskRadius = [1,5];
% cleanedIm_ = cleanImageMedian(im,maskRadius);
% 
% % maskRadius = [1,1];
% % maskSTD = 2;
% % lambda = 3;
% % sharpen_im = sharpen(blurred_im, maskRadius, maskSTD, lambda);
% 
% cleanedIm = cleanImageMedian_multi(addFrameToImage(cleanedIm_, cleanedIm_));
% 
% % show fixed
% % -----------
% putImage(cleanedIm);
% 
% % explain
% % -----------
% disp("");
% pause

% % =======================================================================

% % baby 
% % ===========
% 
% % load tampered image
% % -----------
% im = imread('baby.tif');
% disp("The original image ->")
% putImage(im);
% pause
% 
% % apply fixes
% % -----------
% 
% % fix Salt and Pepper noise
% maskRadius = [1,1];
% cleanedSNPIm = cleanImageMedian(im,maskRadius);
% 
% % get fixed images outline cordinates (corners)
% 
% % [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(cleanedIm);
% 
% % *************************************
% % TODO - consider optimizing point sets
% % *************************************
% 
% full_scale_ps = [1 256 256 1   1;
%                  1 1   256 256 1];
% 
% source_0_ps = [6  112 112 7   6;
%                21 21  131 131 21];
% 
% source_1_ps = [78  148 246 134 78;
%                163 117 162 245 163];
% 
% source_2_ps = [182 251 177 121 182;
%                4   71  122 51  4];
% 
% % putImage(cleanedSNPIm);
% % hold on
% % outline = plot(full_scale_ps(1,:),full_scale_ps(2,:), "-", 'LineWidth',3, 'Color', 'magenta');
% % plot(source_0_ps(1,:),source_0_ps(2,:), "-", 'LineWidth',3, 'Color', 'red');
% % plot(source_1_ps(1,:),source_1_ps(2,:), "-", 'LineWidth',3, 'Color', 'blue');
% % plot(source_2_ps(1,:),source_2_ps(2,:), "-", 'LineWidth',3, 'Color', 'green');
% % pause
% % delete(outline)
% 
% % use map quad to normalize images on same scale
% img_s0 = mapQuad(cleanedSNPIm, source_0_ps, full_ps, 2);
% img_s1 = mapQuad(cleanedSNPIm, source_1_ps, full_ps, 2);
% img_s2 = mapQuad(cleanedSNPIm, source_2_ps, full_ps, 2);
% 
% % imshow(img_s0);
% % pause
% % imshow(img_s1);
% % pause
% % imshow(img_s2);
% % pause
% 
% % use muli frame cleaning of images
% 
% imSet = addFrameToImage(img_s0, img_s1);
% imSet = addFrameToImage(imSet, img_s2);
% cleanedIm = cleanImageMedian_multi(imSet);
% % cleanedIm = cleanImageMean_multi(imSet);
% 
% % show fixed
% % -----------
% imshow(cleanedIm);
% pause
% 
% % % explain
% % % -----------
% % disp("");
% % pause


% % =======================================================================

% % watermelon 
% % ===========
% 
% % load tampered image
% % -----------
% im = imread('watermelon.tif');
% disp("The original image ->")
% putImage(im);
% pause
% 
% % apply fixes
% % -----------
% sharpen_im = sharpen(im, [1,1], 3, 5);
% putImage(sharpen_im);
% pause
% 
% % explain
% % -----------
% disp("");
% pause

% % =======================================================================
% 
% % bears
% % ===========
% 
% % load tampered image
% % -----------
% im = imread('bears.tif');
% disp("The original image ->")
% putImage(im);
% pause
% 
% % apply fixes
% % -----------
% nim = uint8(255 * (double(im)./double(max(im(:)))));
% [nim,a,b] = contrastEnhance(im,[1, 256]);
% putImage(nim);
% pause
% 
% % explain
% % -----------
% disp("");
% pause
% 
% close all

% =======================================================================

% house
% ===========

% load tampered image
% -----------
im = imread('house.tif');
% disp("The original image ->")
% putImage(im);
% pause

% apply fixes
% -----------




maskRadius = [0,5];
t=10;
% cleanedIm = addMotionBlur(im,5);
% cleanedIm = cleanImageMean(im,maskRadius,4);
% cleanedIm = sharpen(cleanedIm, [0,5], 4, 8);
% cleanedIm = cleanImageMedian(im,maskRadius);
% cleanedIm = uint8(conv2(im, (1/t)*ones(t,1)'));
% cleanedIm = uint8(conv2(im, (1/9)*[0 0 0 2 2 1 2 2 0 0 0]));
% mask = [1 1 2 5 2 1 1]';
% mask = [0 0 0 1 1 1 0 0 0];
% cleanedIm = uint8(conv2(ones(256,256), (1/sum(mask(:))) * mask));
% cleanedIm = uint8(conv2(cleanedIm, (1/sum(mask(:))) * mask));



% mask = getGausianMask([0,10], 10);
% cleanedIm = uint8(conv2(im, mask));

% mask = [zeros(3,10) ones(3,2) zeros(3,10)];
mask = [zeros(8,3),[zeros(3,3) ones(3,2) zeros(3,3)]',zeros(8,3)];
cleanedIm = uint8(conv2(im, (1/sum(mask(:)))*mask));

% to fourier
fftim = fft2(cleanedIm);
ffs = fftshift(fftim);
ffl = uint8(log(abs(ffs)+1));



% show fourier transform image
putImage(ffl);
imagesc([-64,63],[-64,63],ffl);
pause

putImage(cleanedIm);
pause

% % explain
% % -----------
% disp("");
% pause

% close all
