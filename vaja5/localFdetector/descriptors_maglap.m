function D = descriptors_maglap(img, px, py, m, bins)
	rad = round((m-1)/2);
	[h w c]  = size(img);
	D = zeros(length(px),bins^2);
 	for i=1:length(px)		
		minx = max([px(i)-rad,1]);
		maxx = min([px(i)+rad,h]);
		miny = max([py(i)-rad,1]);
		maxy = min([py(i)+rad,w]);
		imgWin = img(minx:maxx, miny:maxy, :);
		hist = histmaglap(imgWin,1.6,bins);
		D(i,:) = hist';
	end
end



