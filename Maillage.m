function [coor mvois] = Maillage(nx, ny, pasx, pasy)

% Calcule et renvoie la matrice des coordonn�es et celle des voisins
% coor(i,k) : ki�me coordonn�e du noeud i
% mvois(i,k) : ki�me voisin du noeud i ( en commencant par celui de droite
% et en tournant dans le sens trigo

% Num�rotation et coordonn�es
ntot  = nx*ny;    % nombre total de noeuds
nu    = 0;        % num�ro du noeud courant
coor  = zeros(ntot,2);
mvois = zeros(ntot,4);

for ix = 1:nx
    for iy = 1:ny
        nu = nu+1;
        % Coordonn�es
        coor(nu,1) = (ix-1)*pasx;
        coor(nu,2) = (iy-1)*pasy;
        
        % Remplissage de la matrice des voisins
        if ix < nx
          mvois(nu,1) = nu + ny;
        end
        if ix > 1
            mvois(nu,3) = nu - ny;
        end
        if iy < ny
            mvois(nu,2) = nu + 1;
        end
        if iy > 1
            mvois(nu,4) = nu - 1;
        end
    end
end