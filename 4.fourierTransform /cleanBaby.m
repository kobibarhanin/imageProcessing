function cleanBaby = cleanBaby(type)
%cleanBaby clean Salt and Pepper noise from an image
% map all the part images to the alighn image and multyMedian them
% type 1 clean the image using mapQuad, type 2 clean with regular median

baby=readImage('baby');
putImage(baby);
disp('Original image >>');
pause

if(type==0)
    
    % get fixed images outline cordinates (corners)
    full_scale_ps = [1 256 256 1 1; 1 1 256 256 1];
    source_0_ps = [6 112 112 7 6; 21 21 131 131 21];
    source_1_ps = [78 148 246 134 78; 163 117 162 245 163];
    source_2_ps = [182 251 177 121 182; 4 71 122 51 4];

    disp('Select quads >>');
    hold on
    plot(source_0_ps(1,:),source_0_ps(2,:), "-", 'LineWidth',3, 'Color', 'red');
    plot(source_1_ps(1,:),source_1_ps(2,:), "-", 'LineWidth',3, 'Color', 'blue');
    plot(source_2_ps(1,:),source_2_ps(2,:), "-", 'LineWidth',3, 'Color', 'green');
    pause

    % use map quad to normalize images on same scale
    img_s0 = mapQuad(baby, source_0_ps, full_scale_ps, 2);
    img_s1 = mapQuad(baby, source_1_ps, full_scale_ps, 2);
    img_s2 = mapQuad(baby, source_2_ps, full_scale_ps, 2);

    % use muli frame cleaning of images
    imSet = addFrameToImage(img_s0, img_s1);
    imSet = addFrameToImage(imSet, img_s2);
    cleanedIm = cleanImageMedian_multi(imSet);
    disp('Allign and Multi-median clean >>');
    putImage(cleanedIm);
    pause
    
    disp('Re-quad >>');
    % for every image quad to zero image and collapse to one image
    blankIm = uint8(zeros(256,256));
    img_s0 = mapQuad(cleanedIm, full_scale_ps, source_0_ps, 2, blankIm);
    img_s1 = mapQuad(cleanedIm, full_scale_ps, source_1_ps, 2, blankIm);
    img_s2 = mapQuad(cleanedIm, full_scale_ps, source_2_ps, 2, blankIm);
    cleanBaby = img_s0 + img_s1 + img_s2;
    
elseif(type==1)
    cleanBaby=cleanImageMedian(baby,[1,1]);
else 
    disp 'unsupported option for type';
end

end