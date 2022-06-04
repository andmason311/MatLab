function[] = HW05Problem1()
syms x y
f=2*x^3+6*x*y^2-3*y^3-150*x;
fx=diff(f,x);
fy=diff(f,y);
fxx=diff(fx,x);
fxy=diff(fx,y);
fyy=diff(fy,y);

xsub= sqrt((150-6*y^2)/6);
fy = -9*y^2+12*(xsub)*y;
yvalue=solve(fy==0,y);
xvalue = [5,3];

A1=12*xvalue(1);
A2=12*xvalue(2);
B1=12*yvalue(1);
B2=12*yvalue(2);
C1=12*xvalue(1)-18*yvalue(1);
C2=12*xvalue(2)-18*yvalue(2);
type1=A1*C1-B1^2;
type2=A2*C2-B2^2;
typeA= 6*xvalue(1)^2+6*yvalue(1)^2-150;
typeB= 6*xvalue(2)^2+6*yvalue(2)^2-150;
if type1 > 0 && typeA > 0
    formatSpec = 'The Critical Point (%d,%d) is a Minimum';
elseif type1 > 0 && typeA <= 0
     formatSpec = 'The Critical Point (%d,%d) is a Maximum';
else
    formatSpec = 'The Critical Point (%d,%d) is a Saddle Point';
end
    sprintf(formatSpec,xvalue(1),yvalue(1))

if type2 > 0 && typeB > 0
    formatSpec = 'The Critical Point (%d,%d) is a Minimum';
elseif type2 > 0 && typeB <= 0
     formatSpec = 'The Critical Point (%d,%d) is a Maximum';
else
    formatSpec = 'The Critical Point (%d,%d) is a Saddle Point';
end
    sprintf(formatSpec,xvalue(2),yvalue(2))
end