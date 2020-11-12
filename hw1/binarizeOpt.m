function [bimg, T] = binarizeOpt(img)
%BINARIZEOPT Summary of this function goes here
%   Detailed explanation goes here

[img_oq, qvals_oq] = optimalQuantization(img, 1);
oq_img = qvals_oq(img_oq);

T = floor(mean(qvals_oq));

bimg = img_oq;
bimg(find(img_oq == 1)) = 0;
bimg(find(img_oq == 2)) = 255;

% bimg(find(bimg > 127)

end

