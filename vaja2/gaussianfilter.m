function Ig=gaussianfilter(I)
    g = gauss(2);
    I = conv2(I,g,'same');
    Ig = conv2(I,g','same');

