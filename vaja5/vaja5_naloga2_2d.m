newPath = './localFdetector/' ;
rmpath(newPath) ;  addpath(newPath) ;


I1 = imread('data/house1.jpg');
I2 = imread('data/house2.jpg');

P = najdi_vsa_ujemanja(I1,I2);
x1 = [P(:,[1,2])'; ones(1,length(P))];
x2 = [P(:,[3,4])'; ones(1,length(P))];
length(x1)
[F, e1, e2, x1r, x2r] = ransac_fundmatrix(x1,x2,1,1000);
length(x1r)

%izris

figure(1);clf;
subplot(1,2,1)
imagesc(I1); axis equal; axis tight; hold on; colormap gray;
interval = 1:4;
plot( x1r(1,interval),x1r(2,interval),'y*');
subplot(1,2,2);
imagesc(I2); axis equal; axis tight; hold on;
plot( x2r(1,interval),x2r(2,interval),'y*');

for i=interval
    l2 = F*x1r(:,i);
    prikazipremico( l2, size(I2,2), size(I2,1), 'r' );    
end


figure(2);clf;
subplot(1,2,1)
displaymatches(I1, x1(1,:), x1(2,:), I2, x2(1,:), x2(2,:),inf);
figure(3);clf;
subplot(1,2,2)
displaymatches(I1, x1r(1,:), x1r(2,:), I2, x2r(1,:), x2r(2,:),inf);


