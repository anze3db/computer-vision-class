# Draw the files:
beans = 8;
imgs = {"data/slike/obj58__0.png", "data/slike/obj68__0.png", "data/slike/obj37__0.png"};
img_hist = zeros(length(imgs),beans);
for i = 1:length(imgs)
    img = rgb2gray(imread(imgs{i}));
    [h,w] = size(img) ;
    img1D = reshape(img,w*h,1);
    figure(i); clf;
    subplot(1,2,1); imshow(img);
    title(imgs{i});
    img_hist(i,:) = myhist(img1D,beans);
    subplot(1,2,2); bar(img_hist(i,:));
end
"l2"
getDistanceHist(img_hist(1,:), img_hist(2,:), 'l2')
getDistanceHist(img_hist(1,:), img_hist(3,:), 'l2')
"chi2"
getDistanceHist(img_hist(1,:), img_hist(2,:), 'chi2')
getDistanceHist(img_hist(1,:), img_hist(3,:), 'chi2')
"intersect"
getDistanceHist(img_hist(1,:), img_hist(2,:), 'intersect')
getDistanceHist(img_hist(1,:), img_hist(3,:), 'intersect')
"hell"
getDistanceHist(img_hist(1,:), img_hist(2,:), 'hell')
getDistanceHist(img_hist(1,:), img_hist(3,:), 'hell')
