function izrisiRekonstrukcije2D( P_orig, P_rec )

for i = 1 : size(P_orig,2)
    plot([P_orig(1,i), P_rec(1,i) ] , [P_orig(2,i), P_rec(2,i) ],'k') ;
end
plot(P_orig(1,:), P_orig(2,:),'.r') ;
plot(P_rec(1,:), P_rec(2,:),'.g') ;