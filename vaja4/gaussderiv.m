function [Ix,Iy]=gaussderiv(img,sigma)
    x = [round(-3.0*sigma):round(3.0*sigma)];
    
    Gd = gaussdx(x,sigma);
    G  = gauss(x,sigma);
    Ix = conv2(img, G', 'same');
    Ix = conv2(Ix, Gd, 'same');
    Iy = conv2(img, G, 'same');
    Iy = conv2(Iy, Gd', 'same');
