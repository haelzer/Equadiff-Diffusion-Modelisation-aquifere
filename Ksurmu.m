function ksmu=Ksurmu(X)
%  K(x,y)/mu, d�pend de la position du point X=(x,y)
% Fichier pour le cas d'�tude "Aquif�re"

global Lx Ly 

% croissance lin�aire de la prem�abilit� suivant x
ksmu= 2 + X(1)/Lx + 3*X(2)/Ly;
% zone centrale oblique de faible perm�abilit�
Centre=[2*Lx/3,Ly/2];
u=[0.5;1];
if abs((X-Centre)*u)<Ly/4
    ksmu=1.5; 
end


% zone circulaire de faible permeabilit�
Centre=[Ly/2,2*Ly/3];
rayon=Ly/4;
if norm(Centre-X)<Ly/4
      ksmu=0.2; 
end






