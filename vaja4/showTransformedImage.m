function showTransformedImage(I1,I2, H)
% Function transforms an input image according to the Homography transform
% I1 ... input image
% H ... homography
% Author: Matej Kristan (2010)
figure(1); clf ;
I1_to2 = transformHomography(I1, H) ;
subplot(1,3,1) ; imagesc(I1) ; axis equal ; axis tight ; colormap gray ; title('I1') ;
subplot(1,3,2) ; imagesc(I2) ; axis equal ; axis tight ; colormap gray ; title('I2') ;
subplot(1,3,3) ; imagesc(I1_to2) ; axis equal ; axis tight ; colormap gray ; title('I3') ;