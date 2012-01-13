function h=histmaglap(img,sigma,bins)
% Output:
% h     ... mag/lap histogram which is reshaped into a 1D vector
% --------------------------------------------------------------
% Input:
% img   ... grayscale input image
% sigma ... Gaussian filter parameter
% bins  ... number of bins per histogram channel

  % compute the first derivatives
  [imgMag imgDir] = gradmag(img,sigma);
  imgLap          = laplace(img,sigma);
  
  %quantize the images to "bins" number of values
  imgMag( imgMag > 100 ) = 100;
  imgMag = floor(imgMag*(bins/101))+1;

  imgLap = imgLap + 60;
  imgLap( imgLap < 0 )   = 0;
  imgLap( imgLap > 119 ) = 119;
  imgLap = floor(imgLap*(bins/120))+1;
  
  %define a 2D histogram  with "bins^2" number of entries
  h=zeros(bins,bins);
  
  %execute the loop for each pixel in the image, 
  for i=1:size(img,1)
    for j=1:size(img,2)
      
      %increment a histogram bin which corresponds to the value 
      %of pixel i,j; 
      mag = imgMag(i,j);
      lap = imgLap(i,j);
      h(mag,lap) = h(mag,lap)+1;
    end
  end

  %normalize the histogram such that its integral (sum) is equal 1
  h=h/sum(sum(sum(h))); 
  h = h(:) ;
