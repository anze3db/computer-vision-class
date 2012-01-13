A = imread('data/slike/lenaGray_mini.png') ;
figure(1); clf ; colormap 'gray';
subplot(2,2,1); imagesc(A);
A = gaussderiv(A, 3.0);
subplot(2,2,2); imagesc(A);
