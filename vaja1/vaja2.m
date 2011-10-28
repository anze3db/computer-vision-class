A = imread("data/graf.png");

img = double(rgb2gray(A));
clf; 
%figure(1);
%subplot(1,2,1); imshow(uint8(A));
%subplot(1,2,2); imshow(uint8(img));
figure(2);

[h,w] = size(img) ;
img1D = reshape(img,w*h,1);

bins = 10;
h = hist(img1D,bins);
subplot(1,3,1) ; bar(h) ;
bins = 20;
h = hist(img1D,bins);
subplot(1,3,2) ; bar(h);
bins = 40;
h = hist(img1D,bins);
subplot(1,3,3) ; plot(h);

