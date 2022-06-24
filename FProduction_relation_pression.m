function Prod = FProduction_relation_pression(u, coor, mvois, pasx, pasy, Lz,FoncD)

global MPuits  

nbpuits=size(MPuits,1);

Prod = zeros(1, nbpuits);
for k=1:nbpuits
    Prod(k)=0; % production
    pressionpuits=MPuits(k,2)
    numero_puits=MPuits(k,1);
    for i=1:4
        numero_voisin=mvois(numero_puits,i);
        if numero_voisin>0
          if mod(numero_voisin,2)==1 % noeuds voisins horizontaux
              Prod(k)=Prod(k)+(Lz*pasy)*FoncD(coor(numero_puits,:))*(-pressionpuits+u(numero_voisin))/pasx;
          else %  noeuds voisins verticaux
              Prod(k)=Prod(k)+(Lz*pasx)*FoncD(coor(numero_puits,:))*(-pressionpuits+u(numero_voisin))/pasy;
          end
        end
    end
 end
Prod=Prod(1);