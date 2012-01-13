function [F, e1, e2, x1, x2] = ransac_fundmatrix(ix1, ix2, eps, k)
% Vhod:
% x1,x2 : 3xN matrika N homogenih to?k v 2D

% eps : pragovna vrednost za notri-le?e?e elemente

% k : število iteracij

% Izhod:
% F : 3x3 fundamentalna matrika, definirana kot x2’*F*x1 = 0
% e1 : Epipol v sliki 1, tako da velja F*e1 = 0
% e2 : Epipol v sliki 2, tako da velja F’*e2 = 0
% x1,x2 : 3xNi matrika Ni homogenih notri-le?e?ih to?k

inliners = [];
max = 0;
for i=1:k
    a=randperm(length(ix1));
    [Fa, e1a, e2a] = fundmatrixest_norm(ix1(:,a(1:10)), ix2(:,a(1:10))); 
    [x1in,x2in] = get_inliers(Fa,ix1,ix2,eps);
    
    if length(x1in) > max
       max = length(x1in);
       F = Fa; e1 = e1a; e2 = e2a;
       x1 = x1in;
       x2 = x2in;
    end
    
end
