% im = imread('lena.tif');
% im = imread('stroller.tif');
% putImage(im);
% pause

% im = double(im);

% =========================
% downSample
% =========================
% dsIm = downSample(im);
% putImage(dsIm);
% pause

% =========================
% gaussPyr
% =========================
% gPyr = gaussPyr(im,3);
% putImage(gPyr{1});
% pause
% putImage(gPyr{2});
% pause
% putImage(gPyr{3});
% pause

% =========================
% upSample
% =========================
% usIm = upSample(dsIm);
% putImage(usIm);
% pause

% =========================
% laplacPyr
% =========================
% lPyr = laplacPyr(im,3);
% putImage(lPyr{1});
% pause
% putImage(lPyr{2});
% pause
% putImage(lPyr{3});
% pause

% im_recon = collapseLapPyr(lPyr);
% putImage(im);
% putImage(im_recon);
% sum(sum(im-im_recon))
% pause

% localContrast = localImageContrast(im, 5);
% putImage(uint8(localContrast))
% pause

img1 = readImage('butterfly1.tif');
img2 = readImage('butterfly2.tif');
levels = 3;
rImg = multiImageFocus(img1,img2,levels);
putImage(rImg)
pause

close all
% clear








