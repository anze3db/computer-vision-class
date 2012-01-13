function h = myhist2RGB(img1,bins)
% kvantiziraj vhodno sliko
% (vemo da je najmanj2a moona vrednost piksla 0, najve£ja pa 255)
img1 = double(img1) ; % slika mora biti double!
img1=floor(img1*(bins)/255)+1;
%define a 3D histogram with "bins^3" number of entries
h=zeros(bins,bins,bins);
%execute the loop for each pixel in the image,
for i=1:size(img1,1)
    for j=1:size(img1,2)
        % inkrementiraj celico histograma h(R,G,B),
        % ki ustreza vrednosti piksla i,j
        R=img1(i,j,1);
        G=img1(i,j,2);
        B=img1(i,j,3);
        h(R,G,B)=double(h(R,G,B)+1);
    end
end
% normaliziraj histigram, da je njegov integral (vsota celic) enaka 1
% h=h/sum(sum(sum(h)));

