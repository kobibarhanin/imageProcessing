function [imgNbit,Qvals] = uniformQuantization(img8bit,N)

% floor(img1./16).*16) - this does the whole thing - 1:09,26/10

bin_size = floor(256 / power(2, N));
imgNbit = uint8(ceil(img8bit./bin_size));
imgNbit(imgNbit==0) = 1;

starter = floor(bin_size/2);
Qvals = uint8([starter:bin_size:256]);
end

