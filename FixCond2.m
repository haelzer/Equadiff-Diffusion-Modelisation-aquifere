function Conbord=FixCond2(coor, mvois, Lx, Ly)

% Cette trame de fonction est donnée à titre indicatif et pour vous aider

global MPuits

ntot = size(coor,1) ;  % nombre de noeuds, nombre d'inconnues
Conbord=zeros(ntot,2); % initialisation. première colone: type de condition, 
%                        deuxième colonne: valeur de la condition

for i = 1:ntot
    vois = mvois(i, :);
    if vois(1) == 0    % .----condition à droite 
        Conbord(i,1)=  2; 
        Conbord(i,2)= 0; 
    elseif vois(2) == 0 %--- condition en haut
        Conbord(i,1)= 2 ; 
        Conbord(i,2)= 0 ; 
    elseif vois(3) == 0 %--- condition à gauche 
        Conbord(i,1)=1; 
        Conbord(i,2)=(1-coor(i,2)/Ly) ;
    elseif vois(4) == 0 %--- condition en bas 
         Conbord(i,1)=1; 
         Conbord(i,2)=(1-coor(i,1)/Lx); 
    end
        
end

% traitement des conditions de Dirichlet ponctuelles au centre, pour les...
% "noeuds  puits"


nbpuits=size(MPuits,1);
for ip=1:nbpuits
   nuno        = MPuits(ip,1);
   valpuits    =  MPuits(ip,2)
   Conbord(nuno,1)= 1 ; %les conditions de puits sont de Dirichlet
   Conbord(nuno,2)= valpuits ; %la valeur au puit est valpuits
end