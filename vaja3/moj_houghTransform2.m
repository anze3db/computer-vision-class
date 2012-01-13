function [ro,theta]=moj_houghTransform2(Ie,nBinsRo,nBinsTheta,thresh,idir)
	% a) akumulator:
	[h,w] = size(Ie);
	A = zeros(nBinsRo, 1);
	D = sqrt(h**2 + w**2);
	D_step = D*2/(nBinsRo-1);
	RO = (-D:D_step:D);

	
	T_step = pi/nBinsTheta;
	T = (-pi/2:T_step:(pi/2-T_step));
	TA = zeros(nBinsRo, 1);
	RA = zeros(nBinsRo, 1);
	robovi = Ie;

	[x,y] = size(robovi);
	
	% xcos(theta) + ysin(theta) = ro
	for i = 1:x
		for j = 1:y			
			if robovi(i,j) > 0	

				r = j*cos(idir(i,j)/2) + i*sin(idir(i,j)/2);

				d = round((r/D_step)+nBinsRo/2);
				TA(d) = idir(i,j)/2;
				RA(d) = r;
				A(d) += 1;	
				
			end
		end
	end
	
	A = nonmaxsuppression2D(A);
	
	[s,indexes] = sort(A,'descend');
	
	theta = [];
	ro = [];
	for i = 1:10
		theta = [theta; TA(indexes(i))];
		ro    = [ro; RA(indexes(i))];

	end
	


