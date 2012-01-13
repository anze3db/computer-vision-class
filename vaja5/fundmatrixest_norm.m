function [F, e1, e2] = fundmatrixest_norm(x1, x2)
    [newpts1, T1] = normalize2dpts(x1);
    [newpts2, T2] = normalize2dpts(x2);

    [Fc, ~, ~] = fundmatrixest(newpts1, newpts2);

    F = T2'*Fc'*T1;

    [u,~,v]=svd(F);

    e1 = v(:,3)/v(3,3);
    e2 = u(:,3)/u(3,3);