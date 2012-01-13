function [U,Mu] = getUM(P)
	[m, N] = size(P);
	Mu = mean(P,2);

	X = P - repmat(Mu, 1, size(P,2));
	X = double(X);

	C = 1/(m-1) * (X'*X); % cov(X')

	[Us,S,V] = svd(C);

	s = diag(S) + 1e-15;
	Si = diag(1 ./ s);
	X = double(X);
	Us = double(Us);
	Si = double(Si);
	U = X*Us*Si^(0.5);
	
end