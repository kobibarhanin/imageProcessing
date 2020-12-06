function [newIm] = mapQuad(im, pointsSet1, pointsSet2, transformType)
%MAPQUAD maps quad defined by pointsSet1 to quad defined by pointsSet2 
% using transformType and bilinear interpolation, on image im.

% determine transformation type:
if (transformType == 1)
    A = findAffineTransform(pointsSet1, pointsSet2);
else
    A = findProjectiveTransform(pointsSet1, pointsSet2);
end

% calculate destination polygon (pointsSet2)
X_dest = getPolygonCordinates(pointsSet2);

% prepare for homogeneous calculation
X_dest=[X_dest; ones(length(X_dest(1,:)),1)'];

% calculate destination cordinates vector (equals: inv(A)*X_dest)
X_t = A\X_dest;

% factor out the homogeneous cordinate
X_t = X_t ./ X_t(3,:);
X_t(3,:) = [];

newIm = im;
for i = 1:length(X_dest)
    
    % per every pixel in destination (inverse mapping)
    x_d = X_dest(:,i);
    t = X_t(:,i);

    % in case of out of bounds pixels - color black
    if t(1) > 256 || t(1) < 1 || t(2) < 1 || t(2) > 256 
        newIm(x_d(1),x_d(2)) = 0;
        continue
    end
    
    % pixel assignment:
    newIm(x_d(2),x_d(1)) = bilinearInterpolation(im,t(2),t(1));

end

end


