%newPath = './localFdetector/' ;
%rmpath(newPath) ;  addpath(newPath) ;
%
%%P = load('data/demo_points_house.txt');
%
%%x1 = [P(:,[1,2])'; ones(1,length(P))];
%%x2 = [P(:,[3,4])'; ones(1,length(P))];
%
%I1 = imread('data/house1.jpg');
%I2 = imread('data/house2.jpg');
%
%P = najdi_vsa_ujemanja(I1,I2);
%x1 = [P(:,[1,2])'; ones(1,length(P))];
%x2 = [P(:,[3,4])'; ones(1,length(P))];
%[F, e1, e2, x1, x2] = ransac_fundmatrix(x1,x2,1,1000);
%
%
%
%P1=load('data/house1_camera.txt');
%P2=load('data/house2_camera.txt');
%
%X = triangulate(x1, x2, P1, P2);
%figure(1);clf;
%prikaziTriangulacijo(X)
%I1 = imread('data/house1.jpg');
%I2 = imread('data/house2.jpg');
%
figure(2);clf;
subplot(1,2,1)
imagesc(I1); axis equal; axis tight; hold on;
plot( x1(1,:),x1(2,:),'y*');
subplot(1,2,2)
imagesc(I2); axis equal; axis tight; hold on;
plot( x2(1,:),x2(2,:),'y*');
%
