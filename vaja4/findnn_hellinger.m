function [Idx, Dist] = findnn_hellinger( D1, D2 )
	Idx = [];
	Dist = [];

	for i = 1:size(D1)
		distance = [];
		
		[Bx,By] = size(D2);
		
		%D1D = repmat(D1(i,:), Bx, 1);
		%distance = getHellingerDistance(D1D, D2);
		
		for j = 1:size(D2)
			distance(j) = getHellingerDistance(D1(i,:), D2(j,:));
		end
		
		[s, idx] = sort(distance);
		
		
		Idx(i) = idx(1);
		Dist(i) = s(1);	
		
	end
	
