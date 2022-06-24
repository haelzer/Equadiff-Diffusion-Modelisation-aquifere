function ksmu=Ksurmu(X)
%  K(x,y)/mu, dépend de la position du point X=(x,y)
% Fichier pour le cas d'étude "Aquifère"

global Lx Ly 

% croissance linéaire de la preméabilité suivant x
ksmu= 2 + X(1)/Lx + 3*X(2)/Ly;
% zone centrale oblique de faible perméabilité
Centre=[2*Lx/3,Ly/2];
u=[0.5;1];
if abs((X-Centre)*u)<Ly/4
    ksmu=1.5; 
end


% zone circulaire de faible permeabilité
Centre=[Ly/2,2*Ly/3];
rayon=Ly/4;
if norm(Centre-X)<Ly/4
      ksmu=0.2; 
end






