x = [zeros(1,10),5,zeros(1,3),ones(1,5),5,ones(1,5),zeros(1,15)] ;
figure(1) ; clf ;
subplot(1,3,1); plot(x); axis([1,40,0,7]); title('vhod')
sigma = 2 ;
g=gauss(sigma) ;
x_g = conv2(x,g,'full') ;
W = 4 ;
x_m = preprostaMediana(x, W) ;
subplot(1,3,2); plot(x_g); axis([1,40,0,7]); title('Gauss')
subplot(1,3,3); plot(x_m); axis([1,40,0,7]); title('Mediana')

