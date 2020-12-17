function [noisyIm] = addMotionBlur(im, t)
%ADDSPNOISE Summary of this function goes here
%   Detailed explanation goes here

% assign values
noisyIm = uint8(conv2(im, (1/t)*ones(t,1)'));


end

