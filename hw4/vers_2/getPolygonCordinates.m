function [X_dest] = getPolygonCordinates(pointsSet)
%GETPOLYGONCORDINATES returns a vector of cordinates encapsulated by
% pointSet

min_x_bound = min(pointsSet(1,:));
min_y_bound = min(pointsSet(2,:));
max_x_bound = max(pointsSet(1,:));
max_y_bound = max(pointsSet(2,:));
[x_bound, y_bound] = meshgrid(min_x_bound:max_x_bound, min_y_bound:max_y_bound);
polygon_dst = inpolygon(x_bound, y_bound,pointsSet(1,:),pointsSet(2,:));
[x, y] = find(polygon_dst);
x=x+min_y_bound;
y=y+min_x_bound;
X_dest=[y'; x'];

end

