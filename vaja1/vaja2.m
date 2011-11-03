% a)
img = rgb2gray(imread("data/graf.png"));

[h,w] = size(img) ;
img1D = reshape(img,w*h,1);

figure(1); clf;
subplot(1,3,1); bar(hist(img1D,10));
subplot(1,3,2); bar(hist(img1D,20));
subplot(1,3,3); bar(hist(img1D,40));

% b)
figure(2); clf;
% zakaj nista identična?
subplot(1,3,1); bar(myhist(img1D,10));
subplot(1,3,2); bar(myhist(img1D,20));
subplot(1,3,3); bar(myhist(img1D,40));

% c)
img = double(imread("data/graf.png"));
img(:,:,1) = (img(:,:,1)./(img(:,:,1).+img(:,:,2).+img(:,:,3))*255); % img_g
img(:,:,2) = (img(:,:,2)./(img(:,:,1).+img(:,:,2).+img(:,:,3))*255); % img_r
img(:,:,3) = zeros(size(img,1),size(img,2)); % img_b
img= uint8(img);
figure(3); clf; imshow(img);
plot(myhist2RG(img,10))




% figure(3); clf;

