function I_hess = harrisov_detektor2(img, sigma, thresh )
      [Ix,Iy]=gaussderiv(img,sigma);
      ro = 1.6 * sigma; alfa = 0.06;
      x = -round(3.0*sigma):1:round(3.0*sigma) ;
  
      G = gauss(x,ro);
      Gd = gaussdx(x,ro);
  
      C11 = conv2(Ix.^2,G,'same');
      C11 = conv2(C11,G','same');
  
      C22 = conv2(Iy.^2,G,'same');
      C22 = conv2(C11,G','same');
  
  
      C12 = conv2(Ix.*Iy, G, 'same');
      C12 = conv2(C12, G', 'same');
  
      detC = sigma ** 2 .* (C11.*C22 - C12);
      traceC = sigma ** 2 .* (C11 + C22);
  
      I_hess = detC - 0.06.*(traceC.**2);
  
  
 %     I_hess = nonmaxsuppression2D(I_hess);

