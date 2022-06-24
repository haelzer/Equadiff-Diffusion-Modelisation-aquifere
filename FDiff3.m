function D=FDiff3(X)
%   fonction coef de diffusion de la position du point X
% un exemple, à vous de modifier 
global Lx Ly 

Centre=[Lx/2,Ly/2];
if norm((X-Centre))<Ly/3
   D=0.1*X(1);
else
   D=1;
end
