function imgResult=nonmaxsuppression2D(imgHough)
	% extend the matrix:
	im = zeros(size(imgHough)+2);
	im(2:rows(im)-1,2:columns(im)-1) = imgHough;

	for i = 2:rows(im)-1
		for j = 2:columns(im)-1
			if im(i,j) < max([im(i-1,j-1), im(i-1,j), im(i-1,j+1), im(i,j-1),im(i,j+1),im(i+1,j-1),im(i+1,j),im(i+1,j+1)])
				im(i,j) = 0;
			end
		end
	end

	imgResult = im(2:rows(im)-1,2:columns(im)-1);
