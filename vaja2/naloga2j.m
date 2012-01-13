
A = imread('data/xuq13lm7.bmp') ;
A = rgb2gray(A) ;
% Gaussov sum

Icg = double(A) + 15*randn(size(A)) ;
figure(1); clf ;
subplot(2,2,1); imagesc(Icg); colormap gray;
axis equal; axis tight; title('Gauss sum') ;

Ics = imnoise(A,'salt & pepper',0.2) ;
subplot(2,2,2) ; imagesc( uint8(Ics) ) ; colormap gray ;
axis equal; axis tight; title('Sol in poper') ;
% naredi Gaussov filter
sigma = 1 ;
g=gauss(sigma) ;
Icg_b = gaussianfilter( Icg, g ) ;
Ics_b = gaussianfilter( Ics, g ) ;
subplot(2,2,3) ; imagesc( uint8(Icg_b) ) ; colormap gray ;
axis equal; axis tight; title('filtrirana') ;
subplot(2,2,4) ; imagesc( uint8(Ics_b) ) ; colormap gray ;
axis equal; axis tight; title('filtrirana') ;

