A = imread('data/graf0.png');
A = rgb2gray(A);
figure(1); clf;
subplot(2,2,1);
imagesc(A); hold on;
sigma = 1.0;
thresh = 100;
[ix, iy] = harrisov_detektor(A, sigma, thresh);
drawpoints(A, iy, ix, 'r');
hold off;
[ix, iy] = hessov_detektor(A, sigma, thresh);
subplot(2,2,2);
imagesc(A); hold on;
drawpoints(A, iy, ix, 'g');

subplot(2,2,3);
imagesc(harrisov_detektor2(A, sigma, thresh));


subplot(2,2,4);
title("hessov2");
imagesc(hessov_detektor2(A, sigma, thresh));
