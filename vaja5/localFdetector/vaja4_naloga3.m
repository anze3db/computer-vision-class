A = imread('data/graf0.png');
A = rgb2gray(A);
[px,py] = harrisov_detektor(A, 1, 20000);
figure(1); clf;

hold on;colormap gray ; imagesc(A);plot(py,px, '. r');
hold off;
D1 = descriptors_maglap(A,px,py,20,10);
D2 = descriptors_maglap(A',py,px,20,10);


[pxx, dist] = findnn_hellinger(D1,D2);
[pds, ps] = sort(dist);

figure(2); clf;
displaymatches(A,py(ps(1:20)), px(ps(1:20)), A', px(pxx(ps(1:20))), py(pxx(ps(1:20))), []);
