img = rgb2gray(imread("data/slike/obj58__0.png"));
[h,w] = size(img) ;
img1D = reshape(img,w*h,1);
figure(1); clf;
subplot(1,2,1); imshow(img);
h58 = myhist(img1D,8);
subplot(1,2,2); bar(h58);

img = rgb2gray(imread("data/slike/obj68__0.png"));
[h,w] = size(img) ;
img1D = reshape(img,w*h,1);

figure(2); clf;
subplot(1,2,1); imshow(img);
h68 = myhist(img1D, 8);
subplot(1,2,2); bar(h68);

img = rgb2gray(imread("data/slike/obj37__0.png"));
[h,w] = size(img) ;
img1D = reshape(img,w*h,1);
figure(3); clf;
subplot(1,2,1); imshow(img);
h37 = myhist(img1D,8);
subplot(1,2,2); bar(h37);

getDistanceHist(h58, h68, 'l2')
getDistanceHist(h58, h37, 'l2')

% Bolj podobna je slika 37.
% Močno izražena komponenta je črna barva ozadja
