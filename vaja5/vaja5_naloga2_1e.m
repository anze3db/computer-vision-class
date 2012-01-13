
newPath = './localFdetector/' ;
rmpath(newPath) ;  addpath(newPath) ;


'i)'

P = load('data/demo_points_house.txt');
x1 = [P(:,[1,2])'; ones(1,length(P))];
x2 = [P(:,[3,4])'; ones(1,length(P))];
[F, e1, e2] = fundmatrixest_norm(x1, x2);

Fx = load('F.txt');
    
napaka_F = reprojOdstopanjeSim([85,233,1]', [67,219,1]',F)
napaka_Fx = reprojOdstopanjeSim([85,233,1]', [67,219,1]',Fx)


'ii)'
napaka_F = sum(reprojOdstopanjeSim(x1, x2,F))/length(x1)
napaka_Fx = sum(reprojOdstopanjeSim(x1, x2,Fx))/length(x1)
