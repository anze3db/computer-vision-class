img = imread('data/slike/lenaGray_mini.png') ;
L = laplace(img,1.0);

figure(1); clf;
subplot(1,2,1); title("original"); 
imagesc(img);
subplot(1,2,2); title("Laplace"); 
imagesc(L);
