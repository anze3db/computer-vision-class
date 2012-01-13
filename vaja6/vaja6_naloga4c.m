[P, w, h] = readFolder('data/images/1/');
[U, Mu] = getUM(P);
X = double(P - repmat(Mu, 1, size(P,2)));

b = U(:,1:5);

for i = 1:5
	bi = reshape(b(:,i), w,h);
	figure(i); clf; colormap gray;
	%imagesc(bi)
end

Y = U' * X;

Xi = [];
for i=1:5
	xi = [Y(32,1:2^i) zeros(1,length(Y(32,:))-2^i)];
	xi = U(:,32) * xi;
	Xi = [Xi [xi + repmat(Mu,1,size(xi,2))]];
end

figure(1);	clf; colormap gray;
for i=1:5
	subplot(1,5,i);
	imagesc(reshape(Xi(:,i), w,h));
	
end
