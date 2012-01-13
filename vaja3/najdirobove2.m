function Ie = najdirobove2(I,sigma, theta)
% 1. izračunaj magnitude gradientov
% 2. upraguj magnitude 

	[Imag, Idir] = gradmag(I,sigma);
	Imag = nonmaxsup(Imag, Idir);
	Ie = Imag >= theta;
