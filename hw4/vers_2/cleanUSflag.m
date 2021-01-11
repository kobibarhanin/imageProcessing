function cleanFlag = cleanUSflag()
%cleanUSflag clean the USflag image
% Use lineMask with size of 100 to clean all the rows in the flags
USflag=readImage('USAflag');
putImage(USflag);
disp('Original image >>');
pause

% get cordinates for areas need cleaning
upArea=USflag(1:90,144:300);
downArea=USflag(91:168,1:300);

% create the blur mask
conv=ones(1,100).*(1/100);

% apply mask
upArea=round(conv2(upArea,conv,'same'));
downArea=round(conv2(downArea,conv,'same'));

% insert clean values
cleanFlag=USflag;
cleanFlag(1:90,144:300)=upArea;
cleanFlag(91:168,1:300)=downArea;

end

