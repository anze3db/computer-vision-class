% vaja 1

A = imread('data/graf.png') ;
A = double(A) ;
A = (A / 16);
%A = (A(:,:,1) + A(:,:,2) + A(:,:,3))/3.0 ;
clf;
subplot(1,2,1) ;
imshow(A);
subplot(1,2,2) ;
imagesc(double(A));

