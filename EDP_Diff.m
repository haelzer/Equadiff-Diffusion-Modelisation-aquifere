
% Programme principal pour la r�solution d'une EDP de diffusion
% stationnaire sur un rectangle Lx par Ly avec possiblement des points
% int�rieurs "de Dirichlet" (puits)

close all
clear all  

global Lx Ly
global MPuits
% Donn�es physiques et num�riques

Lx = 2;   % taille cot� en x
Ly = 1;   % taille cot� en y
Lz = 10;
nx = 30;    %nombre de noeuds en x pour le pb de l'aquif�re
ny = 30;    %nombre de noeuds en y pour le pb de l'aquif�re
pasx = Lx / (nx-1); % pas : delta x
pasy = Ly / (ny-1); % pas : delta y 

FoncD=@FDiff1;     % on utilise des pointeurs sur les 3 fonctions 
FoncF=@FSource1;   % qui varient d'un cas � l'autre. Ainsi on ne devra modifier
FCond=@FixCond1;   % leur nom qu'� cet endroit dans le code

% maillage
[coor, mvois] = Maillage(nx, ny, pasx, pasy); % coordonn�es et matrice des voisins

% position de points "puits" si il y en a. Sinon: Puits=[];
%Puits=[1500, 250, 5; 800, 1000, 5];  % ici deux puits
%Puits=[1,0.5,5]; 
Puits=[1,0.5,0.1];
%Puits=[] % si pas de puits
MPuits=PosePuits(Puits, Lx, Ly, coor);

% assemblage du syst�me
Conbord=FCond(coor, mvois, Lx, Ly); % a vous de programmer la construction du tableau Conbord
[A, B] = Assemble(coor, mvois, pasx, pasy, Lx, Ly, Conbord, FoncD, FoncF); % Assemblage syst�me � programmer
% r�solution du systeme lin�aire
u = A\B; % r�solution syst�me

% dessin
PlotNappe(coor, u, nx, ny, pasx, pasy, FoncD) % dessin nappe de pression, champ de vitesses

% calcul de production des puits

nbpuits=size(MPuits,1);

% calcul de la production que l'on peut encapsuler dans une fonction
% Prod contient la production de chaque puits
%Prod=FProduction(u, coor,mvois, pasx, pasy, Lz,FoncD);
