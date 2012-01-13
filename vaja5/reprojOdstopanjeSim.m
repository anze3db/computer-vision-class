function d = reprojOdstopanjeSim(x1, x2, F)
    r1 = reprojOdstopanje(x1,x2,F);
    r2 = reprojOdstopanje(x2,x1,F');
    d = (r1+r2)./2;