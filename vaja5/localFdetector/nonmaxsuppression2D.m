function imgResult=nonmaxsuppression2D(imgHough)
	% extend the matrix:
	im = zeros(size(imgHough)+2);
	[rows,columns] = size(im);
    im(2:rows-1,2:columns-1) = imgHough;

	for i = 2:rows-1
		for j = 2:columns-1
			
			if im(i,j) < max([im(i-1,j-1), im(i-1,j), im(i-1,j+1), im(i,j-1),im(i,j+1),im(i+1,j-1),im(i+1,j),im(i+1,j+1)])
				im(i,j) = 0;
			end
		end
	end

	imgResult = im(2:rows-1,2:columns-1);
