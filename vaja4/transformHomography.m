function I2 = transformHomography(I1, H)
% I1 ... input image
% H  ... homography
% I2 ... output (transformed) image
% Author: Matej Kristan (2010)

I2 = I1*0 ;
[h,w,c] = size(I1) ;
[X,Y] = meshgrid(1:w, 1:h) ;

sx = size(X) ;
sy = size(Y) ;

X = reshape(X,1,sx(1)*sx(2)) ;
Y = reshape(Y,1,sy(1)*sy(2)) ;
p = [X;Y;ones(1,length(X))] ;

% P2 = H*p ;
% P2 = round(P2./repmat(P2(3,:),3,1)) ;
% for i = 1 : length(X)
%    if P2(1,i) >= 1 && P2(1,i) <= w && P2(2,i) >= 1 && P2(2,i) <= h
%        I2(P2(2,i),P2(1,i)) = I1(Y(i),X(i))  ;
%    end
% end
%  

iH = inv(H) ;
P2 = iH*p ;
P2 = round(P2./repmat(P2(3,:),3,1)) ;
for i = 1 : length(X)
   if P2(1,i) >= 1 && P2(1,i) <= w && P2(2,i) >= 1 && P2(2,i) <= h
       I2(Y(i),X(i),1:c) = I1(P2(2,i),P2(1,i),1:c);
   end
end
 