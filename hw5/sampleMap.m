function [board] = sampleMap(sizeX,sizeY)
%CHESSBOARD Summary of this function goes here
%   Detailed explanation goes here

board = zeros(sizeX,sizeY);
board(1:2:sizeX,1:2:sizeY)=1;
board(2:2:sizeX,1:2:sizeY)=0;
board=logical(board);

end
