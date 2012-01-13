g=load('data/gauss_sigma2.txt');
ga = gauss(2);

figure(1); clf;
subplot(1,2,1); bar(g);
subplot(1,2,2); bar(ga);

