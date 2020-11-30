function [] = createMagicMovie (img)
%CREATEMAGICMOVIE Summary of this function goes here
%   Detailed explanation goes here

movieFileName='testMovie.avi';
numFrames=8;
transformType=1;

video=VideoWriter(movieFileName);     
open(video);

[pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);
% hold on



pointsSet_t = pointsSet_0;

for i=1:numFrames/2
    pointsSet_t = (i/(numFrames/2)).*pointsSet_grab + (1-(i/(numFrames/2))).*pointsSet_t;
    
    % to close off the polygon
    pointsSet_t_show=[pointsSet_t pointsSet_t(:,1)];
    
    plot(pointsSet_t_show(1,:),pointsSet_t_show(2,:), "-", 'LineWidth',3, 'Color', 'red')
    % hold on
    
end


end

