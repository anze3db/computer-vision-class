function narisi_premice(th, ro, w, h)
% th ... theta
% ro ... rho
% w ... širina slike preko katere bomo risali
% h ... višina slike preko katere bomo risali

% draw lines
x1 = zeros(1,length(th))  ;
y1 = zeros(1,length(th))  ;  
x2 = zeros(1,length(th)) ;
y2 = zeros(1,length(th))  ;
for i = 1 : length(th)    
    if abs(th(i)) > pi/4        
        x1(i) = 0 ;
        y1(i) = (ro(i) - x1(i).*cos(th(i)))./sin(th(i)) ;
        x2(i) = w ;
        y2(i) = (ro(i) - x2(i).*cos(th(i)))./sin(th(i)) ;
    else
        y1(i) = 0 ;
        x1(i) = (ro(i) - y1(i).*sin(th(i)))./cos(th(i)) ;
        y2(i) = h ;
        x2(i) = (ro(i) - y2(i).*sin(th(i)))./cos(th(i)) ;        
    end
end

P1 = [x1', y1'] ;
P2 = [x2', y2'] ;

hold on ;
for i = 1 : size(P1,1)
    plot([P1(i,1),P2(i,1)], [P1(i,2),P2(i,2)], 'r' ) ;   
end
