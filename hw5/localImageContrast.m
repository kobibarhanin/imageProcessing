function [newImg] = localImageContrast(img,radius)
%LOCALIMAGECONTRAST Summary of this function goes here
%   Detailed explanation goes here

k=radius;

% var({xi}) =  mean({xi^2}) – mean({xi})^2
% xi is the local vector values

% localMean = conv2(img,ones(k,k)./(k*k),'same');
% localMeanPower = conv2(img.^2,ones(k,k)./(k*k),'same');
% newImg = localMeanPower-localMean.^2;

localMean = conv2(img,ones(k,k)./(k*k),'same');
localMeanPower = conv2((double(img)-localMean).^2,ones(k,k)./(k*k),'same');
newImg = localMeanPower;



end

