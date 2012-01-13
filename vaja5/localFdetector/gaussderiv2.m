function [Ixx,Iyy,Ixy] = gaussderiv2(img,sigma)
    img = double(img);
    x = [round(-3.0*sigma):round(3.0*sigma)];
    Gd = double(gaussdx(x,sigma));
    G  = double(gauss(x,sigma));
    [Ix, Iy] = gaussderiv(img, sigma);
    Ixx = conv2(Ix, G', 'same');
    Ixx = conv2(Ixx, Gd, 'same');
    Iyy = conv2(Iy, G, 'same');
    Iyy = conv2(Iyy, Gd', 'same');
    Ixy = conv2(img, Gd', 'same');
    Ixy = conv2(Ixy, Gd, 'same');
    
