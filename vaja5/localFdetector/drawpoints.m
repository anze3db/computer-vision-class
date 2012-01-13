function h=drawpoints(img, px, py, color)
	imagesc(img); colormap gray; hold on ;
	plot(px,py,strcat(color,'.'));
	hold off ;
