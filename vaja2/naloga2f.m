I=load('data/konvsignal.txt');
g=load('data/gauss_sigma2.txt');
Ig = preprostaKonvolucija(I,g);

figure(1); clf;
subplot(1,3,1);  bar(I); title("konvsignal");
subplot(1,3,2);  bar(g); title('gauss sigma2'); 
subplot(1,3,3);  bar(Ig); title('preprostaKonvolucija'); 

sum(g)

Ig = conv2(I,g, 'same');

figure(2); clf;
subplot(1,3,1); bar(I); title('konvsignal');
subplot(1,3,2); bar(conv2(I,g, 'full')); title('conv2 full'); 
subplot(1,3,3); bar(Ig);  title('conv2 same');


sum(g)
