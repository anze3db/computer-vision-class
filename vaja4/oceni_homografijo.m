function H = oceni_homografijo(pxR, pyR, pxT, pyT)
A = [];

for i=1:length(pxR)
A = [A; pxR(i) pyR(i) 1 0      0      0 -pxT(i)*pxR(i) -pxT(i)*pyR(i) -pxT(i);
	    0      0      0 pxR(i) pyR(i) 1 -pyT(i)*pxR(i) -pyT(i)*pyR(i) -pyT(i)];
end
[U,S,V] = svd(A);

h = V(:,length(V))'/V(length(V),length(V(1,:)));

H=reshape(h,3,3);
