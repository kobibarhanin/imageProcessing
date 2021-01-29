function [newImg] = localImageContrast(img,radius)
%LOCALIMAGECONTRAST calculates the image local contrast usig the
% local variance in a window

k=radius;

% The following statements calculates: var({xi}) = mean( ({xi – mean({xi})).^2 )

% mean({xi}):
localMean = conv2(img,ones(k,k)./(k*k),'same');

% mean( ({xi – mean({xi})).^2 ):
newImg = conv2((double(img)-localMean).^2,ones(k,k)./(k*k),'same');

end

