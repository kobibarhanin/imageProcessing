function [noisyIm] = addMotionBlur(im, t)
%ADDSPNOISE Adds motion blur to an image.

noisyIm = uint8(conv2(im, (1/t)*ones(t,1)'));

end

