 function  cleanIm = cleanImageMedian_multi (imArray)
%cleanImageMedian_multi 
%% Denoises a series of images using median filtering across corresponding pixels.
% Input:    imArray - a 3D array in the range [0..255]. Every frame imArray(:,:,i) is an image.              
% 
% Output:   cleanIm - grayscale image in the range [0..255] same size as a frame in imArray.
cleanIm=ones(size(imArray(:,:,1)));
for i=1:256
    for j=1:256
        cleanIm(i,j)=median(imArray(i,j,:));
    end
end


 end

