function I_hess = hessov_detektor2( I, sigma, t )
	[Ixx,Iyy,Ixy] = gaussderiv2(I,sigma);
	I_hess = sigma^4 .* (Ixx.*Iyy - Ixy.^2);
	