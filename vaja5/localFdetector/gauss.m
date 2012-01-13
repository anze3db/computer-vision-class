function g=gauss(x,sigma)
    g = 1/sqrt(2*pi*sigma)*exp(x.^2/(2*sigma)*-1); % <-- !!! tukaj izraˇunajte Gaussovo jedro na x
    g = g / sum(g) ; % normalizirajte, da bo vsota jedra 1

