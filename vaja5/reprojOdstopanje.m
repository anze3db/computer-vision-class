function d = reprojOdstopanje(x1, x2, F)
% izra?unaj epipolarno premico za x1
l2 = F*x1 ;
% izra?unaj razdaljo x2 do l2
d = abs(sum(l2.*x2)) / sqrt(l2(1).^2+l2(2).^2 ) ;
