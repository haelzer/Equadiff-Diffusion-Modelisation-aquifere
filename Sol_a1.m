function f=Sol_a1(coor)
n=length(coor);
for k=1:n
    x=coor(k,1);
    %f(k)=-0.5*x^2+0.5*x+1;
    %f(k)=1-0.5*x;
    f(k)=sin(5*x)/5 +1 +(-sin(10)*0.1 - 0.5)*x ;
end
f=f';
