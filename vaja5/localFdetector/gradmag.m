function [Imag, Idir] = gradmag(img,sigma)
    [Ix, Iy] = gaussderiv(img, sigma);
    Imag = sqrt(Ix.^2 + Iy.^2);
    Idir = atan2(Iy,Ix);
