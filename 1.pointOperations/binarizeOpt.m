function [bimg, T] = binarizeOpt(img)
%BINARIZEOPT This function finds the 1 bit optimal quantization of the source
% image and builds the binary image [0, 255] from the quantized one.


[img_oq, qvals_oq] = optimalQuantization(img, 1);

T = floor(mean(qvals_oq));

bimg = qvals_oq(img_oq);
bimg(find(img_oq == 1)) = 0;
bimg(find(img_oq == 2)) = 255;

end

