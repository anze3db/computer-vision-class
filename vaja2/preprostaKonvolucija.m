function Ig = preprostaKonvolucija(I, g)
    N = (length(g)-1)/2 ;
    Ig = zeros(1, length(I)) ;
    for i = N+1 : length(I)-N
    i_levo = max([1, i-N]) ;
    i_desno = min([length(I), i+N]) ;
    Ig(i) = sum(g.*I(i_levo:i_desno)) ;
end

