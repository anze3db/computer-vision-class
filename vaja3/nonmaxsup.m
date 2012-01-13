function imgMax=nonmaxsup(imgMag,imgDir)
[h , w] = size(imgMag);
imgMax = zeros(h,w);
offx = [-1 -1 0 1 1 1 0 -1 -1];
offy = [ 0 -1 -1 -1 0 1 1 1 0];
for y = 1 : h
	for x = 1 : w
		dir = imgDir(y,x); % poglej orientacijo slik. elementa
		idx = round(((dir+pi)/pi)*4) + 1; % pretvori orientacijo za vpogledno tabelo
		y1 = y + offy(idx) ; x1 = x + offx(idx) ;
		y2 = y - offy(idx) ; x2 = x - offx(idx) ;
		% omejitve koordinat
		x1 = max([1,x1]) ; x1 = min([w,x1]) ;
		y1 = max([1,y1]) ; y1 = min([h,y1]) ;
		x2 = max([1,x2]) ; x2 = min([w,x2]) ;
		y2 = max([1,y2]) ; y2 = min([h,y2]) ;
		% preveri ali je lokalni max
		if( (imgMag(y,x) >= imgMag(y1,x1))&&(imgMag(y,x) >= imgMag(y2,x2)) )
		imgMax(y,x) = imgMag(y,x) ;
		end
	end
end
