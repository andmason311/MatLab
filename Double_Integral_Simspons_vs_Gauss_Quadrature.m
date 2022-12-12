clc;
clear all
a=0;b=3;
c=0;d=3;
sxs=4;sys=6;
sxg=2;syg=3;
M1=1;M2=2;
f=@(x,y) 27-2*x.^2-y.^2;
[Is]=myDoubleIntegral(f,a,b,c,d,M1,sxs,sys);
[Ig]=myDoubleIntegral(f,a,b,c,d,M2,sxg,syg);
T=table(Is,Ig,'RowNames',{'Required Integral'});
T.Properties.VariableNames={'Simpsons 1/3 Rule' 'Gauss Quadrature'}
    
function [I] = myDoubleIntegral(f, a, b, c, d, M, sx, sy)
if M == 1 % Simpsons 1/3 Rule
    hx=(b-a)/sx;
    hy=(d-c)/sy;
    x=a:hx:b;
    y=c:hy:d;
    [X,Y]=meshgrid(x,y);
    z=f(X,Y);
    Ix=0;
    Ixy=0;
    for i=1:sx/2
        Ix=Ix+(z(:,2*i-1)+4*z(:,2*i)+z(:,2*i+1))*(hx/3); 
    end
    for i=1:sy/2
        Ixy=Ixy+(Ix(2*i-1)+4*Ix(2*i)+Ix(2*i+1))*(hy/3); 
    end
    I=Ixy;
end
if M==2 %Gauss Quadrature
    ax1=(b+a)/2; ax2=(b-a)/2; ay1=(d+c)/2; ay2=(d-c)/2;
    x=@(dx) ax1+ax2*dx; 
    y=@(dy) ay1+ay2*dy;    
    if sx==0 
       Cx=2;
       xi=0;
    elseif sx==1
            Cx=[1 1];
            xi=[(-1/sqrt(3)) (1/sqrt(3))];
    elseif sx==2
            Cx=[5/9 8/9 5/9];
            xi=[-sqrt(3/5) 0 sqrt(3/5)]; 
    elseif sx==3
            Cx=[(18-sqrt(30))/36 (18+sqrt(30))/36 (18+sqrt(30))/36 (18-sqrt(30))/36];
            xi=[-sqrt(525+70*sqrt(30))/35, -sqrt(525-70*sqrt(30))/35 sqrt(525-70*sqrt(30))/35 sqrt(525+70*sqrt(30))/35];
    elseif sx==4 
            Cx=[(322-13*sqrt(70))/900 (322+13*sqrt(70))/900 128/225 (322+13*sqrt(70))/900 (322-13*sqrt(70))/900]; 
            xi=[-sqrt(245+14*sqrt(70))/21 -sqrt(245-14*sqrt(70))/21 0 sqrt(245-14*sqrt(70))/21 sqrt(245+14*sqrt(70))/21];
    elseif sx==5
            Cx=[0.171324492379170 0.360761573048139 0.467913934572691 0.467913934572691 0.360761573048131  0.171324492379170];
            xi=[-0.932469514203152 -0.661209386466265 -0.238619186083197 0.238619186083197 0.661209386466265 0.932469514203152];
    end
    if sy==0 
       Cy=2;
       yi=0;
    elseif sy==1
            Cy=[1 1];
            yi=[(-1/sqrt(3)) (1/sqrt(3))];
    elseif sy==2
            Cy=[5/9 8/9 5/9];
            yi=[-sqrt(3/5) 0 sqrt(3/5)]; 
    elseif sy==3
            Cy=[(18-sqrt(30))/36 (18+sqrt(30))/36 (18+sqrt(30))/36 (18-sqrt(30))/36];
            yi=[-sqrt(525+70*sqrt(30))/35, -sqrt(525-70*sqrt(30))/35 sqrt(525-70*sqrt(30))/35 sqrt(525+70*sqrt(30))/35];
    elseif sy==4 
            Cy=[(322-13*sqrt(70))/900 (322+13*sqrt(70))/900 128/225 (322+13*sqrt(70))/900 (322-13*sqrt(70))/900]; 
            yi=[-sqrt(245+14*sqrt(70))/21 -sqrt(245-14*sqrt(70))/21 0 sqrt(245-14*sqrt(70))/21 sqrt(245+14*sqrt(70))/21];
    elseif sy==5
            Cy=[0.171324492379170 0.360761573048139 0.467913934572691 0.467913934572691 0.360761573048131  0.171324492379170];
            yi=[-0.932469514203152 -0.661209386466265 -0.238619186083197 0.238619186083197 0.661209386466265 0.932469514203152];
    end
    [X,Y]=meshgrid(x(xi),y(yi));
    z=f(X,Y);
    Ix=0;
    Ixy=0;
        for i=1:length(xi) 
            Ix=Ix+Cx(i)*z(:,i);
        end
        Ix=Ix*ax2; 
        for j=1:length(yi)
            Ixy=Ixy+Cy(j)*Ix(j); 
        end
        I=Ixy*ax2; 
end
end