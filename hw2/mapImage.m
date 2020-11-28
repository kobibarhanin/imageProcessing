function [newIm] = mapImage(im, pointsSet1, pointsSet2, transformType)
%MAPIMAGE Summary of this function goes here
%   Detailed explanation goes here
if (transformType == 1)
    A = findAffineTransform(pointsSet1, pointsSet2);
else
    A = findProjectiveTransform(pointsSet1, pointsSet2);
end



% get a standard cordinates vector
% 1 1, 1 2, 1 3, .. N N
M = [];
for i = 1:256 
    M = [M; [1:256; ones(256,1)'*i]];
end


% add ones row [V ones(256,1)]
% this will be your X
X_s = [reshape(M,2,256*256); ones(256*256,1)'];

% calc X' by multyplying with A
% floor/round cordinates (NN)
X_t = abs(round(A*X_s));
X_t(3,:) = [];
X_s(3,:) = [];

% get actual pixel values mapping
newIm = ones(256,256);
for i = 1:length(X_t)
    
    t = X_s(:,i);
    k = X_t(:,i)';
    
%      FIX THIS SHIT!
    if k(1) > 256 || k(1) == 0 || k(2) == 0 || k(2) > 256
        continue
    end
    
    newIm(t(1),t(2)) = im(k(1),k(2));
    
end

end

