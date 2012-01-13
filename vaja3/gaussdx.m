function gd = gaussdx(x,sigma)
    gd = -1/(sqrt(2*pi)*sigma**3)*x.*exp(-(x.**2)/(2*sigma**2));
    gd = gd / (0.5 * sum(abs(gd)));

