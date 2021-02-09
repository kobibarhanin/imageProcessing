function [noisyIm] = addSPnoise(im, p)
%ADDSPNOISE Adds salt and pepper noise to an image.

% generate random linear indices according to p
rand_i=find(rand(size(im)) < p);

% generate random permutation of size of rand_i to use for scribbeling
% rand_i values to pepper and salt
rand_perm = uint64(randperm(length(rand_i)));

% half salt, half pepper
half = round(length(rand_i)/2);
pepper = rand_i(rand_perm(1:half));
salt = rand_i(rand_perm(half+1:end));

% assign values
noisyIm = im;
noisyIm(pepper)=0;
noisyIm(salt)=255;

end

