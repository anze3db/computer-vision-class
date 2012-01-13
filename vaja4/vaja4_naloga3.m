A = imread('data/graf0.png');
A = rgb2gray(A);
%[px,py] = harrisov_detektor(A, 1.9, 2000000);
length(px)
figure(1); clf;

hold on; imshow(A);plot(py,px, '. r');
hold off;
%D1 = descriptors_maglap(A,px,py,20,10);
%D2 = descriptors_maglap(A',py,px,20,10);


%[pxx, dist] = findnn_hellinger(D1,D2);
min(dist)
[pds, ps] = sort(dist);
getHellingerDistance(D1(ps(1),:), D2(pxx(ps(1)),:))
figure(2); clf;
displaymatches(A,py(ps(1000:1010)), px(ps(1000:1010)), A', px(pxx(ps(1000:1010))), py(pxx(ps(1000:1010))), []);
