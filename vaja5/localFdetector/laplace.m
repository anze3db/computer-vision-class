function L = laplace(img,sigma)
    [Ixx, Iyy, Ixy] = gaussderiv2(img, sigma);
    L = sigma^2 .* (Ixx + Iyy); 
