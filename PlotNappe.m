function PlotNappe(coor, P, nx, ny, pasx, pasy,FoncD, fig)
% dessin de la nappe avec couleurs=pressions
% coor: tableau des coordonnées
% P: vecteur des pressions P(i)= pressin du noeud i
% nx, ny : nb de noeuds en x et y
% pasx, pasy : pas de discrétisation en x et y
% retour à une structure xy pour le dessin
 if ~exist('fig','var')
     % third parameter does not exist, so default it to something
      fig=1;
 end
nu = 0;
MP=zeros(ny,nx);

for ix = 1:nx;
    for iy = 1:ny;
        nu = nu+1;
        X(ix) = coor(nu,1);
        Y(iy) = coor(nu,2);       
        MP(iy,ix) = P(nu);   % MP(iy,ix)= pression au noeud ix,iy (attention matlab inverse)
        KM (iy,ix)=FoncD([X(ix),Y(iy)]);
    end
end

[XX,YY] = meshgrid(X,Y);

figure(fig)

subplot(2,1,1)
contour(X,Y,MP,20)  % MP-dec on descend artificiellement de dec (à ajuster) pour voir les fleches
[px,py] = gradient(MP,pasx,pasy);  % calcul matlab du gradient
px = -KM.*px;       % flux = -K/mu grad p
py = -KM.*py;
hold on
quiver(XX,YY,px,py,1.5)% dessin des flèches
axis equal
view (2)
hold off


subplot(2,1,2)
colormap('jet')
surf(X,Y,MP) 
axis equal

cb = colorbar; 
ylabel(cb,'u') 


view (2)
shading 'interp'
hold on
pause(0.1)
hold off