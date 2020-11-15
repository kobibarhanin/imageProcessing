function [bimg] = binarize(img,T)
%BINARIZE This functions performs the simplest threshold based
%binerization.

img(img>T) = 255;
img(img<=T) = 0;

bimg = img;

end

