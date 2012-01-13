% !!! PREDEN ZAÈNETE:
% najprej vkljuèite pot do vaše vaje 4, kjer ste implementirali detektorje
% znaèilnih toèk in deskriptorje.
% v spremenljivko newPath vpišite to pot -- Lahko pa v mapi Vaja5 kerirate 
% mapo localFdetector in vanjo skopirate vso kodo z vaje5. V tem primeru
% bo spodnja pot že kar prav nastavljena.
newPath = './localFdetector/' ;
rmpath(newPath) ;  addpath(newPath) ;


f_nm = 'house' ;
fname1 = ['data/',f_nm,'1.jpg'] ;
fname2 = ['data/',f_nm,'2.jpg'] ;
fname_points = ['data/','test_tocke.txt'] ;

% naloži slike
a_l = imread(fname1) ;
a_r = imread(fname2) ;

% prikaži slike
% figure(1) ; clf ;
% subplot(1,2,1) ; imagesc(a_l) ; axis equal ; axis tight ; hold on ;
% title('Leva kamera') ;
% subplot(1,2,2) ; imagesc(a_r) ; axis equal ; axis tight ; hold on ;
% title('Desna kamera') ;

% load data 
pts = load('data/house_matches.txt') ; 

pts_l = pts(1:10,1:2)' ;
pts_r = pts(1:10,3:4)' ;

% figure(2); clf ;
% displaymatches(a_l, pts_l(1,:), pts_l(2,:), a_r, pts_r(1,:), pts_r(2,:), []) ;

figure(1); clf;
P = load('data/demo_points_house.txt');
x1 = [P(:,[1,2])'; ones(1,length(P))];
x2 = [P(:,[3,4])'; ones(1,length(P))];
[F, e1, e2] = fundmatrixest_norm(x1, x2);
F

Fx = load('F.txt');
Fx
p = [85;233;1];
r = [67;219;1];

l2 = F*p; 
l2T = Fx*p;

%izris
I1 = imread('data/house1.jpg');
I2 = imread('data/house2.jpg');

figure(1);clf;
subplot(1,2,1)
imagesc(I1); axis equal; axis tight; hold on;colormap gray;
plot( p(1),p(2),'y*');
subplot(1,2,2)
imagesc(I2); axis equal; axis tight; hold on;
plot( r(1),r(2),'y*');
prikazipremico( l2, size(I2,2), size(I2,1), 'r' );

figure(2);clf;
subplot(1,2,1)
imagesc(I1); axis equal; axis tight; hold on;colormap gray;
plot( p(1),p(2),'y*');
subplot(1,2,2)
imagesc(I2); axis equal; axis tight; hold on;
plot( r(1),r(2),'y*');
prikazipremico( l2T, size(I2,2), size(I2,1), 'r' );

