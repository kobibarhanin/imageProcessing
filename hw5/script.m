im = imread('lena.tif');
putImage(im);
pause

dsIm = downSample(im);
putImage(dsIm);
pause

imPyr = gaussPyr(im,3);
putImage(imPyr{1});
pause
putImage(imPyr{2});
pause
putImage(imPyr{3});
pause
