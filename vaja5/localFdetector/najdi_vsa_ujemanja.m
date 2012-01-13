function M=najdi_vsa_ujemanja(A,B)

%A = imread('data/img/img1_0.ppm');
%B = imread('data/img/img2_0.ppm');

%A = rgb2gray(A);
%B = rgb2gray(B);
% i.
[Apx,Apy] = hessov_detektor(A, 1.1, 1000);
[Bpx,Bpy] = hessov_detektor(B, 1.1, 1000);
% ii.
%length(Apx)
%return
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
M = [Apx(matching), Apy(matching), Bpx(Id1(matching)), Bpy(Id1(matching)), matching_dist'];
return

[sr, in] = sort(matching_dist);

interval = 1:10;
resultAy = Apy(matching(in(interval)));
resultAx = Apx(matching(in(interval)));
resultBy = Bpy(Id1(matching(in(interval))));
resultBx = Bpx(Id1(matching(in(interval))));


figure(1);clf;
displaymatches(A, resultAy, resultAx, B, resultBy, resultBx, inf)
figure(3);clf;
subplot(1,2,1);imshow(A); hold on;plot(Apy,Apx, 'r .');
subplot(1,2,2);imshow(B); hold on;plot(Bpy,Bpx, 'g .');
%displaymatches()




