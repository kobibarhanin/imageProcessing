function [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im)
%GETUSERINPUTS gets required quads from user

disp('select a start quad')
[ps0_x, ps0_y] = getPolygon("c");
disp('select a grab quad')
[psg_x, psg_y] = getPolygon("y");
disp('select an end quad')
[ps1_x, ps1_y] = getPolygon("m");

pointsSet_grab = double([psg_x, psg_y]');
pointsSet_0 = double([ps0_x, ps0_y]');
pointsSet_1 = double([ps1_x, ps1_y]');

% close off all polygons
pointsSet_grab=[pointsSet_grab pointsSet_grab(:,1)];
pointsSet_0=[pointsSet_0 pointsSet_0(:,1)];
pointsSet_1=[pointsSet_1 pointsSet_1(:,1)];

end

