img = imread('data/slike/lenaGray_mini.png') ;
figure(1); clf;

subplot(1,3,1); imshow(najdirobove(img, 3.0, 30))
subplot(1,3,2); imshow(najdirobove(img, 3.0, 10))
subplot(1,3,3); imshow(najdirobove(img, 3.0, 1))

