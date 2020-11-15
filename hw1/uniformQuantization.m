function [imgNbit,Qvals] = uniformQuantization(img8bit,N)
% UNIFORMQUANIZATION This function returns the uniform quantization of the
% image by N+1 bins.

bin_size = floor(256 / power(2, N));
imgNbit = uint8(ceil(img8bit./bin_size));
imgNbit(imgNbit==0) = 1;

starter = floor(bin_size/2);
Qvals = uint8([starter:bin_size:256]);
end

