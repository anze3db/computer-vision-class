function [x1in x2in] = get_inliers(F, x1, x2, eps)
    i = find(reprojOdstopanjeSim(x1, x2, F) < eps);    
    x1in = x1(:,i);
    x2in = x2(:,i);