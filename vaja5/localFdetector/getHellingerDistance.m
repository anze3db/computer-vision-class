function d = getHellingerDistance( h1, h2 )
    d = 1/2 * sqrt(sum((sqrt(h1) - sqrt(h2)).^2));
end
