function h = myhist2RG(img1,bins)

img1 = double(img1);
img1=uint8(floor(img1*(bins)/255)+1);

h=zeros(bins,bins);
%execute the loop for each pixel in the image,

for i = 1 : bins
    
endfor

for i = 1 : size(h,1)
    for j = 1 : size(h,2)
        h(i,j) = sum(sum(img1(:,:,1) == i & img1(:,:,2) == j));
    end
end

h=h/sum(sum(sum(h)));

