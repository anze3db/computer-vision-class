function displaymatches(I1, px1, py1, I2, px2, py2, N)

	if N < 0		
		N = min([-N, length(px1)]) ;
		rand_idx = randperm(length(px1)) ;
		Idx = rand_idx(1:N) ;
	else
		N = min([N, length(px1)]) ;
		Idx = 1 : N ;
	end

	px1 = px1(Idx) ; py1 = py1(Idx) ; px2 = px2(Idx) ; py2 = py2(Idx) ;
	[h1, w1, cn1] = size(I1) ; [h2, w2, cn2] = size(I2) ;
	h = max([h1, h2]) ; w = w1 + w2 + 1 ; cn = max([cn1,cn2]) ;
	I = zeros(h,w,cn) ;
	I(1:h1,1:w1,1:cn1) = I1 ;
	I(1:h2,w1+1:w1+w2,1:cn2) = I2 ;
	clf ; imagesc(uint8(I)) ; hold on ;
	axis equal ; axis tight ; colormap gray ;
	plot([w1+1,w1+1],[0,h], 'r', 'LineWidth', 4) ;
	px2 = px2 + w1+1 ; plot([px1', px2'], [py1', py2'], 'oy') ;
	for i = 1 : length(px1)
	plot([px1(i),px2(i)], [py1(i),py2(i)], 'g-') ;

end
