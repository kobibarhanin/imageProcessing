function [X,Y] = linspaceVec(pointsSet_from,pointsSet_to, points)
%LINSPACEVEC Summary of this function goes here
%   Detailed explanation goes here

x_f = pointsSet_from(1,:);
x_t = pointsSet_to(1,:);
y_f = pointsSet_from(2,:);
y_t = pointsSet_to(2,:);
X = [];
Y = [];

for i=1:length(x_f)
    X = [X; linspace(x_f(i),x_t(i),points)];
    Y = [Y; linspace(y_f(i),y_t(i),points)];
end

end

