function Prod = FProduction(u, coor, mvois, pasx, pasy, Lz,FoncD)

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


 % On affiche les résultats de production de chaque puit et la production
 % totale
 for numero_puits=1:nbpuits
    fprintf('Production puits %i : %6.2f \n',numero_puits,Prod(numero_puits))
 end
 prodtot=sum(Prod);
 fprintf('Production totale : %6.2f \n',prodtot)
end   


