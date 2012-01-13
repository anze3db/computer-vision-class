function [F e1 e2] = fundmatrixest(x1, x2)
% Vhod:
% x1,x2 : 3xN matrika N homogenih to?k v 2D
% Izhod:
% F : 3x3 fundamentalna matrika, tako da velja x2’*F*x1 = 0
% e1 : epipol v prvi sliki, tako da velja F*e1 = 0
% e2 : epipol v drugi sliki, tako da velja F’*e2 = 0

u1 = x1(1,:)'; v1 = x1(2,:)';
u2 = x2(1,:)'; v2 = x2(2,:)';

A = [u1.*u2, u1.*v2, u1, v1.*u2, v1.*v2, v1, u2, v2, ones(size(u1, 1),1)];

[~,~,V] = svd(A);
v = V(:,length(V));
Ft = reshape(v,3,3)';

[U,D,V] = svd(Ft);
D(3,3) = 0;
F = U * D * V';
[U,D,V] = svd(F);
e1 = V(:,3)/V(3,3);
e2 = V(:,3)/U(3,3);
