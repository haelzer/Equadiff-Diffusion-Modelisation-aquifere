
% Programme principal pour la résolution d'une EDP de diffusion
% stationnaire sur un rectangle Lx par Ly avec possiblement des points
% intérieurs "de Dirichlet" (puits)

close all
clear all  

global Lx Ly
global MPuits
% Données physiques et numériques

Pin=15;
Pout=10;
Lx = 2000;   % taille coté en x
Ly = 1200;   % taille coté en y
Lz = 10;
nx = 40;    %nombre de noeuds en x pour le pb de l'aquifère
ny = 20;    %nombre de noeuds en y pour le pb de l'aquifère
pasx = Lx / (nx-1); % pas : delta x
pasy = Ly / (ny-1); % pas : delta y 

FoncD=@Ksurmu;     % on utilise des pointeurs sur les 3 fonctions 
FoncF=@FSource5;   % qui varient d'un cas à l'autre. Ainsi on ne devra modifier
FCond=@FixCond5;   % leur nom qu'à cet endroit dans le code

% maillage
[coor, mvois] = Maillage(nx, ny, pasx, pasy); % coordonnées et matrice des voisins

% valeur au puits:
valpuits=0:0.1:40;
produc=zeros(length(valpuits))
for k=1:length(valpuits)
    Puits=[1500, 250, valpuits(k)]
    MPuits=PosePuits(Puits, Lx, Ly, coor);

    Conbord=FCond(coor, mvois, Lx, Ly, Pin, Pout); % a vous de programmer la construction du tableau Conbord
    [A, B] = Assemble(coor, mvois, pasx, pasy, Lx, Ly, Conbord, FoncD, FoncF); % Assemblage système à programmer
    u = A\B;

    nbpuits=size(MPuits,1);
    produc(k)=FProduction_relation_pression(u, coor,mvois, pasx, pasy, Lz,FoncD);
end


figure(1)
hold on
plot(valpuits,produc)
title( "Production en fonction de la valeur au puits" , 'FontSize', 18)
grid
hold off
