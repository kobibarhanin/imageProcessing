function [] = createMagicMovie (img)
%CREATEMAGICMOVIE Summary of this function goes here
%   Detailed explanation goes here

movieFileName='testMovie.avi';
numFrames=48;
transformType=1;

% video=VideoWriter(movieFileName);     
% open(video);

% [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);
% hold on

% ============================================
% dev points pre-determined - lena
% ============================================
% imshow(img)
% hold on
% pointsSet_0=[16    51    57    20   16;
%              223   211   238   240  223];
% plot(pointsSet_0(1,:),pointsSet_0(2,:), "-", 'LineWidth',3, 'Color', 'y')
% 
% pointsSet_grab=[113   178   184    99   113;
%                 117   116   183   191   117];
% plot(pointsSet_grab(1,:),pointsSet_grab(2,:), "-", 'LineWidth',3, 'Color', 'c')
% 
% pointsSet_1=[13   58   59   13  13;
%              17   15   55   63   17];
% plot(pointsSet_1(1,:),pointsSet_1(2,:), "-", 'LineWidth',3, 'Color', 'm')

% ============================================

% ============================================
% dev points pre-determined - lighthouse
% % ============================================
imshow(img)
hold on
pointsSet_0=[11    41    56    17   11;
             223   204   228   245  223];
plot(pointsSet_0(1,:),pointsSet_0(2,:), "-", 'LineWidth',3, 'Color', 'y')

pointsSet_grab=[6   64   78    9    6;
                21   20   78   75    21];
plot(pointsSet_grab(1,:),pointsSet_grab(2,:), "-", 'LineWidth',3, 'Color', 'c')

pointsSet_1=[190   211   203   154  190;
             57    61   114   100    57];
plot(pointsSet_1(1,:),pointsSet_1(2,:), "-", 'LineWidth',3, 'Color', 'm')

% ============================================

pointsSet_t = pointsSet_0;

for i=1:numFrames/2
    pointsSet_t = (i/(numFrames/2)).*pointsSet_grab + (1-(i/(numFrames/2))).*pointsSet_t;
    imshow(img)
    % to close off the polygon
    pointsSet_t_show=[pointsSet_t pointsSet_t(:,1)];
    
    plot(pointsSet_t_show(1,:),pointsSet_t_show(2,:), "-", 'LineWidth',3, 'Color', 'red')
    % hold on
    pause(0.1)
end

pointsSet_t = pointsSet_grab;

% SHOULD NOT WORK ON ENTIRE IMAGE
for i=(numFrames/2+1):numFrames
    pointsSet_t = (i/(numFrames)).*pointsSet_1 + (1-(i/(numFrames))).*pointsSet_t;
        
    imshow(img)
    img_altered = mapQuad(img, pointsSet_grab, pointsSet_t, 2);
    imshow(img_altered)

    % to close off the polygon
    pointsSet_t_show=[pointsSet_t pointsSet_t(:,1)];
    
    plot(pointsSet_t_show(1,:),pointsSet_t_show(2,:), "-", 'LineWidth',3, 'Color', 'red')
    % hold on
    pause(0.1)

end

