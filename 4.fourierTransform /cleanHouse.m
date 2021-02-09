function cleanHouse = cleanHouse()
%cleanHouse clean the house image

house=readImage('house');
putImage(house);
disp('Original image >>');
pause

[~,housefftshow]=getFFT2(house);
housefft=fft2(house);
putImage(housefftshow);
imagesc(housefftshow);
colormap('gray');

disp 'We can clearly see the pattern in X-axis direction'
disp 'we can clean it with X-axis rect convolution'
disp 'we will do it in the freq domain.'
pause

conv_Xaxis = zeros(1,10);
conv_Xaxis(1,1:10) = 1/10;
fft_Xaxis = fft2(conv_Xaxis,size(house,1),size(house,2));
housefft=housefft./fft_Xaxis;
housefft(isnan(housefft))=0;

cleanHouse=uint8(real(ifft2(housefft)));

end

