function F=FSource(X)

global Lx Ly

centre=[Lx/2,Ly/2];
if norm(X-centre)<Ly/4
    F=-20;
else
    F=0;
end