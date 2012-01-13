function [ro,theta]=moj_houghTransform(Ie,nBinsRo,nBinsTheta,thresh)
	% a) akumulator:
	[h,w] = size(Ie);
	A = zeros(nBinsRo, nBinsTheta);
	D = sqrt(h**2 + w**2);
	D_step = D*2/(nBinsRo-1);
	RO = (-D:D_step:D);
	
	T_step = pi/nBinsTheta;
	T = (-pi/2:T_step:(pi/2-T_step));
	
	robovi = Ie;

	[x,y] = size(robovi);
	
	% xcos(theta) + ysin(theta) = ro
	for i = 1:x
		for j = 1:y			
			if robovi(i,j) > 0				
				for k = 1:nBinsTheta

					r = j*cos(T(k)) + i*sin(T(k));

					d = round((r/D_step)+nBinsRo/2);

					A(d,k) += 1;	
				end
			end
		end
	end
	figure(2); clf;

	subplot(1,3,1);imagesc(A);
	A = nonmaxsuppression2D(A);
	subplot(1,3,2);imagesc(A);
	res = [];
	res_i = [];
	for i = 1:rows(A)
		for j = 1:columns(A)
			if A(i,j) > thresh
				res = [res;A(i,j)];
				res_i = [res_i; i,j];
			else
				A(i,j) = 0;
			end
		end
	end

	subplot(1,3,3);imagesc(A);
	hold on;
	
	[s,indexes] = sort(res,'descend');
	
	
	
	ro = [];
	theta = [];

	for i = 1:10
		theta = [theta; T(res_i(indexes(i),2))];
		ro    = [ro; RO(res_i(indexes(i),1))];
		plot(res_i(indexes(i),2),res_i(indexes(i),1), 'x');
	end
	


