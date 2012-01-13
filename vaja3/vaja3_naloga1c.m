imgImp = zeros(25,25); imgImp(13,13) = 255;

sigma = 6.0;
x = [round(-3.0*sigma):round(3.0*sigma)];
G = gauss(x,sigma)
D = gaussdx(x,sigma)

figure(1); clf;
subplot(3,2,1); imagesc(imgImp);
subplot(3,2,2); imagesc(conv2(conv2(imgImp, G, 'same'), G', 'same')); title("a) G in G'");
subplot(3,2,3); imagesc(conv2(conv2(imgImp, G, 'same'), D', 'same')); title("b) G in D'");
subplot(3,2,4); imagesc(conv2(conv2(imgImp, D, 'same'), G', 'same')); title("c) D in G'");
subplot(3,2,5); imagesc(conv2(conv2(imgImp, G', 'same'), D, 'same')); title("d) G' in D");
subplot(3,2,6); imagesc(conv2(conv2(imgImp, D', 'same'), D, 'same')); title("e) D' in G");