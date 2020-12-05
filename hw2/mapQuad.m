function [newIm] = mapQuad(im, pointsSet1, pointsSet2, transformType)

% determine transformation type:
if (transformType == 1)
    A = findAffineTransform(pointsSet1, pointsSet2);
else
    A = findProjectiveTransform(pointsSet1, pointsSet2);
end

% get generic cordinates vector:
M = getCordinatesVector(256);


polygon_dst = inpolygon(M(1,:),M(2,:),pointsSet2(1,:),pointsSet2(2,:));
polygon_dst_view = reshape(polygon_dst,256,256);
imshow(polygon_dst_view);
[x,y] = find(polygon_dst_view);
X_dest=[y'; x'; ones(length(x),1)'];
plot(pointsSet2(1,:),pointsSet2(2,:), "-", 'LineWidth',3, 'Color', 'blue')

newIm = im;

X_t = A\X_dest;
X_t = round(X_t ./ X_t(3,:));

for i = 1:length(X_dest)
    
    x_d = X_dest(:,i);
    t = X_t(:,i);

    
    if t(1) > 256 || t(1) < 1 || t(2) < 1 || t(2) > 256 
        newIm(x_d(1),x_d(2)) = 0;
        continue
    end
    
    % pixel assignment:
    newIm(x_d(2),x_d(1)) = im(t(2),t(1));
    
    % pixel sources:
%     newIm(t(2),t(1)) = im(x_d(2),x_d(1));
    
end

end


