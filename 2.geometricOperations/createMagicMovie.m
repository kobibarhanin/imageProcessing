function [] = createMagicMovie (movieFileName, numFrames, img, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
%CREATEMAGICMOVIE creates the magic movie required.

imshow(img);
hold on

if nargin == 4
    % get user input quads
    [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);
end

video=VideoWriter(movieFileName);     
open(video);

% calculate polygon advancment vector from pointsSet_0 to pointsSet_grab
[X_t,Y_t] = linspaceVec(pointsSet_0, pointsSet_grab, numFrames/2);

for i=1:numFrames/2
    
    % calculate the polygon at time t
    pointsSet_t = [X_t(:,i) Y_t(:,i)]';
    
    % plot the polygon at time t
    p = plot(pointsSet_t(1,:),pointsSet_t(2,:), "-", 'LineWidth',3, 'Color', 'c');
    
    % record frame at time t
    frameT = getframe(gcf);
    writeVideo(video,frameT);
    
    % remove ploted polygon
    delete(p);
end

% calculate polygon advancment vector from pointsSet_grab to pointsSet_1
[X_t,Y_t] = linspaceVec(pointsSet_grab, pointsSet_1, numFrames/2);

for i=1:numFrames/2
    
    % calculate the polygon at time t
    pointsSet_t = round([X_t(:,i) Y_t(:,i)]');
        
    % show the altered image at time t
    img_t = mapQuad(img, pointsSet_grab, pointsSet_t, transformType);
    imshow(img_t);
    
    % plot the polygon at time t
    p = plot(pointsSet_t(1,:),pointsSet_t(2,:), "-", 'LineWidth',3, 'Color', 'c');

    % record frame at time t
    frameT = getframe(gcf);
    writeVideo(video,frameT);
    
    % remove ploted polygon
    delete(p);
end

plot(pointsSet_t(1,:),pointsSet_t(2,:), "-", 'LineWidth',3, 'Color', 'c');

close(video);

