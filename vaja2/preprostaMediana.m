function Ig = preprostaMediana(I, W)
    N = ceil((W-1)/2) ;
    Ig = zeros(1, length(I)) ;
    for i = N+1 : length(I)-N
        i_levo = max([1, i-N]) ;
        i_desno = min([length(I), i+N]) ;
        vals = sort(I(i_levo:i_desno)) ;
        Ig(i) = vals(round(length(vals)/2)) ;
    end

