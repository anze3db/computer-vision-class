function d = getChi2Distance( h1, h2 )
    d = 0.5 * (sum((h1-h2).**2./(h1+h2+0.0000000001)));
end
