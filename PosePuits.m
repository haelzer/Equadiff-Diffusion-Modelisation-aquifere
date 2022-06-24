function MPuits = PosePuits(Puits, Lx, Ly, coor)
% transforme la structure de donn�es Puits (coordonn�es des puits et
% valeurs de la fonction u aux puits)
%en structure MPuits (num�ro des noeud puits et valeur de la pression aux puits
% pour ce faire, recherche le noeud le plus proche des coordonn�es de chaque puits 
% en ces noeuds seront impos�es des conditions de Dirichlet


nbpuits = size(Puits,1);
if nbpuits==0
    MPuits=[];  % renvoie un tableau vide si pas de puits
else
  ntot = size(coor,1);
  MPuits = zeros(nbpuits, 2);

  for k = 1:nbpuits
    dmin = Lx + Ly;
    for i = 1:ntot
        d = norm(Puits(k,1:2)-coor(i,:));
        if d <= dmin
            dmin = d;
            MPuits(k, 1) = i;
            MPuits(k, 2) = Puits(k,3);
        end
    end
  end
end
