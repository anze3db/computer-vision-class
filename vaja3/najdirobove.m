function Ie = najdirobove(I,sigma, theta)
% 1. izračunaj magnitude gradientov
% 2. upraguj magnitude 
	[Imag, Idir] = gradmag(I,sigma);
	Ie = Imag >= theta;
