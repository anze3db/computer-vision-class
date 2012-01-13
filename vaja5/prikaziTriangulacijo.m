function prikaziTriangulacijo( X )
 
plot3(X(1,:), X(2,:), X(3,:), 'r.') ; hold on ;
%return
for i = 1 : size(X,2) 
   text(X(1,i), X(2,i), X(3,i), num2str(i)) ;
end
axis equal ; box on ;

% ------------------------------------------------------- %
