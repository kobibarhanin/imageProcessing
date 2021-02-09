function [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im)
%GETUSERINPUTS gets required quads from user

disp('select a grab quad')
[psg_x, psg_y, pg] = getPolygon("y");
disp('select a start quad')
[ps0_x, ps0_y, p0] = getPolygon("c");
disp('select an end quad')
[ps1_x, ps1_y, p1] = getPolygon("m");

pointsSet_grab = double([psg_x, psg_y]');
pointsSet_0 = double([ps0_x, ps0_y]');
pointsSet_1 = double([ps1_x, ps1_y]');

% close off all polygons
pointsSet_grab=[pointsSet_grab pointsSet_grab(:,1)];
pointsSet_0=[pointsSet_0 pointsSet_0(:,1)];
pointsSet_1=[pointsSet_1 pointsSet_1(:,1)];

% allow user to view polygons selected briefly
pause(1);

delete(p0);
delete(pg);
delete(p1);

end

