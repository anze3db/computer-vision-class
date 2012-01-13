% IZRIS TOCK:

figure(1) ; clf ;
P = load( 'data/vaja6_2D_tocke.txt') ;

%subplot(1,2,1) 
plot(P(1,:),P(2,:),'+') ; hold on ;
axis([0 10 0 10])
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i) ) ; 
end
xlabel('x_1') ; ylabel('x_2') ;
axis equal ;

% calculate mean and covariance matrix

Mu = mean(P,2) ;
Mu
Mu_rep = repmat(Mu,1,size(P,2));
X = P - Mu_rep;
X
C = (X*X')/(size(X,2)-1); % cov(X')

[U,S,V] = svd(C);

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

% kumulativna vrednost lastnih vrednosti:

g = [S(1,1), S(2,2)];
g = g ./ sum(g);
g = cumsum(g);
figure(2); clf;
bar(g);

% pretvorba v prosotr PCA:
Y = U' * X;
% odstranimo prvi lastni vektor:
Y(1,:) = 0;
% transformacija nazaj v originalni prostor:
X1 = (U * Y) + Mu_rep;

figure(1)
plotgauss2d(Mu, C, 'R', 1);
izrisiRekonstrukcije2D(P,X1);


% f)
T = [3,6]';
XT = T - repmat(Mu,1,size(T,2));
Y = U' * XT;
Y(2,:) = 0;
XT1 = (U * Y);
XT1 += repmat(Mu,1,size(XT1,2));

plot(3,6,'or')
izrisiRekonstrukcije2D(T,XT1);
