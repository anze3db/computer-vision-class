[P, w, h] = readFolder('data/images/2/');


[h1,w1] = size(P);

Pp = double(mean(P,2));
X = reshape(Pp, w,h);

Mu = mean(X,2);
Mu_rep = repmat(Mu,1,size(X,2));
X = X - Mu_rep;

C = (X*X')/(size(X,2)-1);
[U,S,V] = svd(C);

Y = U' * X;

for x = -20:20:500
	
	
	Y(:,2) = Y(:,2) + 5*sin(x);
	Y(:,3) = Y(:,3) + 5*cos(x);
	
	X1 = U * Y;	
	
	X1 = X1 + Mu_rep;
	figure(2);
	imagesc(X1);
	pause(0.1);
end;


return

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



