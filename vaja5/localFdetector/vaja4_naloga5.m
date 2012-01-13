% b)
A = imread('data/NewYork/im1_small.pgm');
B = imread('data/NewYork/im5_small.pgm');

%g=load('data/newyork_1_to_5_points_small.txt')
%figure(2); clf;
%displaymatches(A, g(1,:), g(2,:), B, g(3,:), g(4,:), []);
%figure(3); clf;
%H = oceni_homografijo(g(1,:), g(2,:), g(3,:), g(4,:));
%showTransformedImage(A,B,H');


[Apx,Apy] = harrisov_detektor(A, 2, 10^5);
[Bpx,Bpy] = harrisov_detektor(B, 2, 10^5);
length(Apx)
%figure(1); clf;
%subplot(1,2,1);imshow(A); hold on; plot(Apy, Apx, 'r .');
%subplot(1,2,2);imshow(B); hold on; plot(Bpy, Bpx, 'g .');
%return
% ii.
AD = descriptors_maglap(A,Apx,Apy,41,16);
BD = descriptors_maglap(B,Bpx,Bpy,41,16);

% iii.

[Id1, dist1] = findnn_hellinger(AD,BD);
[Id2, dist2] = findnn_hellinger(BD,AD);

matching = [];
matching_dist = [];
for i = 1:length(Id1)
   if(i == Id2(Id1(i)))
       matching = [matching, i];
       matching_dist = [matching_dist, dist1(Id1(i))];
   end
end

[sr, in] = sort(matching_dist);

interval = 1:4;
resultAy = Apy(matching(in(interval)));
resultAx = Apx(matching(in(interval)));
resultBy = Bpy(Id1(matching(in(interval))));
resultBx = Bpx(Id1(matching(in(interval))));

figure(2);clf;
displaymatches(A, resultAy, resultAx, B, resultBy, resultBx, inf)
%figure(1);clf;
%displaymatches(B, Bpy(i2(interval)), Bpx(i2(interval)), A, Apy(Id2(i2(interval))), Apx(Id2(i2(interval))), [])

figure(3);
H = oceni_homografijo(resultAx, resultBx, resultBx, resultBy);
showTransformedImage(B,A,H');

return


%[s1, i1] = sort(dist1);
%[s2, i2] = sort(dist2);
%for i=1:6
%	s1(i)
%	getHellingerDistance(AD(i1(i),:), BD(Id1(i1(i)),:))
%	"NEW"

%	figure(i); clf;
%	subplot(1,2,1);
%	imshow(A); hold on; plot(Apy((i1(i))), Apx(i1(i)), 'g x');plot(Apy, Apx, 'r .'); 
%	subplot(1,2,2);
%	imshow(B); hold on; plot(Bpy(Id1(i1(i))), Bpx(Id1(i1(i))), 'g x');plot(Bpy, Bpx, 'r .'); 
interval = 1:10;

resX = [];
resY = [];

%for i=length(Apx)
%
%	if(length(resX) >= 10) 
%		break
%	end
%
%	j = find(Apy(Id2(i2)) == Apy(i1(i)) & any(Apx(Id2(i2)) == Apx(i1(i))))
%	if(j > 0)
%		resX = [resX, i];
%		resY = [resY, j];	
%	end 	
%end





%g=load('data/newyork_1_to_5_points_small2.txt');
%figure(4); clf;
%H = oceni_homografijo(g(1,:), g(2,:), g(3,:), g(4,:));
%showTransformedImage(A,B,H');
%figure(5);clf;
%displaymatches(A, g(1,:), g(2,:), B, g(3,:), g(4,:), []);
%
