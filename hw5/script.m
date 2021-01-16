im = imread('lena.tif');
% putImage(im);
% pause
im = double(im);

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
lPyr = laplacPyr(im,3);
% putImage(lPyr{1});
% pause
% putImage(lPyr{2});
% pause
% putImage(lPyr{3});
% pause

im_recon = collapseLapPyr(lPyr);
putImage(im);
putImage(im_recon);
sum(sum(im-im_recon))
pause


close all
% clear








