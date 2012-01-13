function d = getDistanceHist( h1, h2, dist_name )
    switch dist_name
        case 'l2'
            d = getL2Distance( h1, h2 );
        case 'chi2'
            d = getChi2Distance( h1, h2 );
        case 'hell'
            d = getHellingerDistance( h1, h2 );
        case 'intersect'
            d = getIntersectionDistance( h1, h2 );
        otherwise
            error('Nepoznan parameter!');
end

