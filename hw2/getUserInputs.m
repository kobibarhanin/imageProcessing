function [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im)
%GETUSERINPUTS Summary of this function goes here
%   Detailed explanation goes here

imshow(im);
[ps0_x, ps0_y] = getPolygon("c");
[psg_x, psg_y] = getPolygon("y");
[ps1_x, ps1_y] = getPolygon("m");

pointsSet_grab = [psg_x, psg_y]';
pointsSet_0 = [ps0_x, ps0_y]';
pointsSet_1 = [ps1_x, ps1_y]';

end

