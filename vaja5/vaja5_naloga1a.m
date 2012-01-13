% 

f = 2.5;
T = 120;

pz = (0.1:0.1:10);

D = (f * T)./pz;
figure(1); clf;
plot(pz, D);
ylabel('Oddaljenost pz [mm]');
xlabel('Dispariteta D [mm]');
title('Dispariteta');
