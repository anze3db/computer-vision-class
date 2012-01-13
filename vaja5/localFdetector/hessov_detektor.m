function [px,py] = hessov_detektor( I, sigma, t )
	[Ixx,Iyy,Ixy] = gaussderiv2(I,sigma);
	I_hess = sigma**4 .* (Ixx.*Iyy - Ixy.**2);
	
	[px,py] = find(nonmaxsuppression2D(I_hess) > t);
	return
	px = [];
	py = [];
	[x,y] = size(I_hess);
	for i = 1:x
		for j = 1:y
			if I_hess(i,j) > 0
				px = [px, i];
				py = [py, j];
			end
		end
	end
