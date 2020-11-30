function [M] = getCordinatesVector(size)
%GETCORDINATESVECTOR Summary of this function goes here
%   Detailed explanation goes here

M = [];
% get a standard cordinates vector
% 1 1, 1 2, 1 3, .. N N
for i = 1:size 
    M = [M; [1:size; ones(size,1)'*i]];
end
M = reshape(M,2,size*size);

end

