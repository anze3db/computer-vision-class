function X = triangulate( pts_1, pts_2, P_1, P_2)
% vhod:
% pts_1 ... 3xN to?k leve kamere v homogenih koordinatah

% pts_2 ... 3xN to?k desne kamere v homogenih koordinatah

% P_1 ... 3x4 kalibracijska matrika leve kamere
% P_2 ... 3x4 kalibracijska matrika desne kamere
% izhod :
% X ... 4XN vektor 3D to?k v homogenih koordinatah

X = [] ;
for i = 1 : size(pts_1,2)
    a1 = crossForm(pts_1(:,i)) ;
    a2 = crossForm(pts_2(:,i)) ;
    c1 = a1*P_1 ;
    c2 = a2*P_2 ;
    A = [ c1(1:2,:); c2(1:2,:) ] ;
    % naredite SVD dekompozicijo matrike A
    % re?itev za to?ko zapi?ite v vektor x
    [U,D,V] = svd(A);
	V = V./V(4,4);
	x = V(:,length(V)); 
    X = [X, x] ;
end
