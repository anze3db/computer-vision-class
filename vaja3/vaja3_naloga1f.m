img = imread('data/slike/lenaGray_mini.png') ;
[Imag, Idir] = gradmag(img,1.0);

figure(1); clf;
subplot(1,3,1); title("original"); 
imagesc(img);
subplot(1,3,2); title("Imag"); 
imagesc(Imag);
subplot(1,3,3); title("Idir"); 
imagesc(Idir);
