function [X,w,h] = readFolder(folder)
	a = dir(folder);
	X = [];
	w = 0; 
	h = 0;
	for i=3:66
			
		A = imread(strcat([folder, a(i).name]));
		%rgb2gray(A)
		[w,h] = size(A);		
		
		X = [X reshape(A,w*h, 1)];
	endfor
