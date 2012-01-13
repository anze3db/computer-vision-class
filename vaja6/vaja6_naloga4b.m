[P, w, h] = readFolder('data/images/1/');
[U, Mu] = getUM(P);
X = double(P - repmat(Mu, 1, size(P,2)));

b = U(:,1:5);

for i = 1:5
	bi = reshape(b(:,i), w,h);
	figure(i); clf; colormap gray;
	%imagesc(bi)
end


figure(2); clf;
P(4074,:) = 0;
imagesc(reshape(P(:,1), w,h));


Y = U' * X;

%Y(1,:) = 0;
X1 = U * Y;
X1 = X1 + repmat(Mu,1,size(X1,2));

figure(1); clf;
imagesc(reshape(X1(:,1), w,h));
