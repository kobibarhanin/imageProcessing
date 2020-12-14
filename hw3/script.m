im = imread('lena.tif');
p = 0.05;

% noisySNPImage = addSPnoise(im,p);
% imshow(noisySNPImage);

s = 0.2;
noisyGAUSImage = addGaussianNoise(im,s);
imshow(noisyGAUSImage);
