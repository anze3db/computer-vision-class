img = imread('data/slike/examGrade.jpg') ;
img = rgb2gray(img);
[xxxx, idir] = najdirobove3(img, 10.0, 10);
[h,w] = size(xxxx);
[ro, theta] = moj_houghTransform2(xxxx,300, 300, 100,idir);
figure(1); clf;
imshow(img);
narisi_premice(theta, ro, w, h);
%subplot(1,2,2); imagesc(a);