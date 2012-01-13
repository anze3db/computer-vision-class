% a)

img = (imread("data/phone2.jpg"));
colormap('gray');
[h,w] = size(img);
img1D = reshape(img,w*h,1);

figure(1); clf;
%subplot(1,2,1); imshow(img); 
%subplot(1,2,2); bar(myhist(img1D,255));

%figure(2); clf;
imgR = razteghist(img);
imgR1D = reshape(imgR,w*h,1);
%subplot(1,2,1); imshow(imgR);
%subplot(1,2,2); bar(myhist(imgR1D,255));

% b)
imgE = equihist(img);
imgE1D = reshape(imgE,w*h,1);

% c)
figure(3); clf;
subplot(3,3,1); imshow(img); 
subplot(3,3,2); imshow(imgR); 
subplot(3,3,3); imshow(imgE); 

[h0, c0] = myhist(img1D,256);
[h1, c1] = myhist(imgR1D,256);
[h2, c2] = myhist(imgE1D,256);

subplot(3,3,4); bar(c0, h0);
subplot(3,3,5); bar(c1, h1);
subplot(3,3,6); bar(c2, h2); 

cs0 = cumsum(h0); cs0 = cs0 / max(cs0);
cs1 = cumsum(h1); cs1 = cs1 / max(cs1);
cs2 = cumsum(h2); cs2 = cs2 / max(cs2);

subplot(3,3,7); bar(cs0);
subplot(3,3,8); bar(cs1);
subplot(3,3,9); bar(cs2);
