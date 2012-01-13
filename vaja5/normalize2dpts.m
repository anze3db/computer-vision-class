function [newpts, T] = normalize2dpts(pts)
% pts ... 2xN matrika to?k s slike

% newts ... 3XN matrika to?k (homogene koordinate)

pts = pts(1:2,:) ; Mu = mean(pts,2) ;
pt = pts - repmat(Mu,1,size(pts,2)) ; mean_dist = mean(sqrt(sum(pt.^2,1))) ;
scale = sqrt(2)/mean_dist ;
T = [scale, 0, -Mu(1)*scale ;...
0 scale -Mu(2)*scale; 0 0 1] ;
newpts = zeros(3,size(pts,2)) ;
for i = 1 : size(pts,2)
newpts(:,i) = T*[pts(:,i);1] ;
end
