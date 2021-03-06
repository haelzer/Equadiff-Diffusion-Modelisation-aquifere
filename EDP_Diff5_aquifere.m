
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

% position de points "puits" si il y en a. Sinon: Puits=[];
Puits=[1500, 250, 5; 800, 1000, 5]
%Puits=[] % si pas de puits
MPuits=PosePuits(Puits, Lx, Ly, coor);

% assemblage du système
Conbord=FCond(coor, mvois, Lx, Ly, Pin, Pout); % a vous de programmer la construction du tableau Conbord
[A, B] = Assemble(coor, mvois, pasx, pasy, Lx, Ly, Conbord, FoncD, FoncF); % Assemblage système à programmer
% résolution du systeme linéaire
u = A\B; % résolution système

% dessin
PlotNappe(coor, u, nx, ny, pasx, pasy, FoncD) % dessin nappe de pression, champ de vitesses

% calcul de production des puits

nbpuits=size(MPuits,1);

% calcul de la production que l'on peut encapsuler dans une fonction
% Prod contient la production de chaque puits
Prod=FProduction(u, coor,mvois, pasx, pasy, Lz,FoncD);
