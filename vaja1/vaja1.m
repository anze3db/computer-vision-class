% vaja 1
% b)
A = imread('data/graf.png') ;
figure(1); clf; imagesc(A);
figure(2); clf; imshow(A);


% c)
I = rgb2gray(A);
figure(4); clf; imshow(I);


% d)
figure(5); clf;
colormap('gray'); imagesc(A);
%colormap('bone'); imagesc(I);
%colormap('jet'); imagesc(I);

% e)
vrstica200 = A(200,:);
stolpec200 = A(:,200);
figure(6); clf;
subplot(1,2,1); plot(stolpec200); title('Stolpec 200');
subplot(1,2,2); plot(vrstica200); title('Vrstica 200');

% f)
A1 = A;
A1(130:260,240:450,2) = 0;
figure(7); clf;
subplot(1,2,1); imshow(A1);
subplot(1,2,2); imshow(A(130:260,240:450,:));

% g)
A2 = rgb2gray(A) > 150;
figure(8); clf; imshow(A2);

% h)
A = A / 16;
figure(9); clf;
subplot(1,2,1) ; imshow(uint8(A));
subplot(1,2,2) ; imagesc(double(A)); % imagesc raztegne sivinski nivo čez celoten spekter


