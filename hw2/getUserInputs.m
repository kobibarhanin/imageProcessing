function [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im)
%GETUSERINPUTS Summary of this function goes here
%   Detailed explanation goes here

imshow(im);
pointsSet_grab = getPolygon("y");
pointsSet_0 = getPolygon("c");
pointsSet_1 = getPolygon("m");

end

