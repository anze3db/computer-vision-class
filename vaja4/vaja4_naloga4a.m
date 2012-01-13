A = imread('data/img/img1_0.ppm');
B = imread('data/img/img2_0.ppm');

A = rgb2gray(A);
B = rgb2gray(B);
% i.
%[Apx,Apy] = harrisov_detektor(A, 1.6, 10000000);
%[Bpx,Bpy] = harrisov_detektor(B, 1.6, 10000000);
%length(Apx)
%return;
% ii.

%AD = descriptors_maglap(A,Apx,Apy,41,16);
%BD = descriptors_maglap(B,Bpx,Bpy,41,16);

% iii.

%[Id1, dist1] = findnn_hellinger(AD,BD);
%[Id2, dist2] = findnn_hellinger(BD,AD);

resultAx = [];
resultAy = [];

resultBx = [];
resultBy = [];

[s1, i1] = sort(dist1);
[s2, i2] = sort(dist2);

figure(2);clf;
displaymatches(A, Apy(i1(interval)), Apx(i1(interval)), B, Bpy(Id1(i1(interval))), Bpx(Id1(i1(interval))), [])
figure(1);clf;
displaymatches(B, Bpy(i2(interval)), Bpx(i2(interval)), A, Apy(Id2(i2(interval))), Apx(Id2(i2(interval))), [])

return
for i = 1:length(Id1)
	for j = 1:length(Id2)
		if (Apy(i1(i)) == Apy(Id2(i2(j))) & Apx(i1(i)) == Apx(Id2(i2(j)))) 
			resultAx = [resultAx, Apx(i1(i))];
			resultAy = [resultAy, Apy(i1(i))];
			resultBx = [resultBx, Bpx(Id1(i1(i)))];
			resultBy = [resultBy, Bpy(Id1(i1(i)))];
		end
		
	end
	if (length(resultAx) > 10)
		break
	end
end

figure(1);clf;
displaymatches(A, resultAy, resultAx, B, resultBy, resultBx, inf)
figure(3);clf;
subplot(1,2,1);imshow(A); hold on;plot(Apy,Apx, 'r .');
subplot(1,2,2);imshow(B); hold on;plot(Bpy,Bpx, 'g .');
%displaymatches()
