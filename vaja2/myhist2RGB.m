function h = myhist2RGB(img1,bins)
% kvantiziraj vhodno sliko
% (vemo da je najmanjša možna vrednost piksla 0, največja pa 255)
img1=double(img1) ; % slika mora biti double!
img1=floor(img1*(bins)/255)+1;

%define a 3D histogram with "bins^3" number of entries
h=zeros(bins,bins,bins);
%execute the loop for each pixel in the image,

for R = 1:bins
    for G = 1:bins
        for B = 1:bins            
            h(R,G,B) = sum(sum(img1(:,:,1) == R & img1(:,:,2) == G & img1(:,:,3) == B));
        endfor
    endfor
endfor

% normaliziraj histigram, da je njegov integral (vsota celic) enaka 1
h=h/sum(sum(sum(h)));
