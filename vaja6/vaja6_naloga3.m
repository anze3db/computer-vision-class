P = load( 'data/vaja6_2D_tocke.txt') ;

%subplot(1,2,1) 
plot(P(1,:),P(2,:),'+') ; hold on ;
axis([0 10 0 10])
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i) ) ; 
end
xlabel('x_1') ; ylabel('x_2') ;
axis equal ;
[U, Mu] = getUM(P);
Mu_rep = repmat(Mu,1,size(P,2));
X = P - Mu_rep;


%lastni vektorji

a1 = [U(1,1), U(2,1)];
% normalizacija:
a1 = a1./sqrt(sum(a1.**2));
a1 *= S(1,1);

a2 = [U(1,2), U(2,2)];
% normalizacija:
a2 = a2./sqrt(sum(a2.**2));
a2 *= S(2,2);

% izris lastnih vektorjev:
plot([Mu(1); a1(1)+Mu(1)], [Mu(2); a1(2)+Mu(2)], '-r')
plot([Mu(1); a2(1)+Mu(1)], [Mu(2); a2(2)+Mu(2)], '-g')