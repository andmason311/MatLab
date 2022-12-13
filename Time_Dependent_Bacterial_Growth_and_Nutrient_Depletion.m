clear; clc; close all;

% Input Values:
r=1.35; a=0.004; g=0.24; No=0.00022; So=0.008; m=0.25; T=30; dt=0.5;

[ N, S ] = bacGrowth( r, a, g, m, No, So, T, dt );

function[ N, S ] = bacGrowth( r, a, g, m, No, So, T, dt )
% Bacteria growth using the Monod model with maintenance energy
% input parameters
% r = maximum growth rate
% a = half saturation constant
% g = growth yield
% No = initial bacteria population
% So = initial nutrient concentration
% T = Total time
% dt = time step
% output parameters
% N = bacteria population
% S = nutrient concentration
n=T*2;
S = zeros(n,1); S(1)=So;
N = zeros(n,1); N(1)=No;

for i=1:n-dt
    S(i+1) = -N(i)/g*(r*S(i))/(a+S(i))*dt;
    S(i+1)=S(i)+S(i+1);
    N(i+1) = (N(i)*(r*S(i)/(a+S(i)))-m*N(i))*dt;
    N(i+1)=N(i)+N(i+1);
end
figure
plot(0:dt:n/2-dt, S,'b-',0:dt:n/2-dt,N,'r-'); 
xlabel('time(hours)');
ylabel('Concentration(g/mL)');
title('Nutrient and Bacteria');
legend('Nutrient Concentration','Bacteria Weight')
t=N; y=S; yo = So/No;
f = @(t, y) t./y;
figure
[yh] = myHeun(f,t,yo);
[yrk] = myrk(f,t,yo);
plot(t, yh,'b-',t, yrk,'r-'); 
xlabel('time(hours)');
ylabel('Concentration(g/mL)');
title('Phase Diagram: Nutrient to Bacteria Ratio')
legend('Heun','RK')
end

function [yh] = myHeun(f,t,yo)  
h = 0.5; n = length(t);
yh = zeros(n,1); yh(1) = yo;
for i = 1:n-1
    k1 = f(t(i),yh(i));
    yh(i+1) = yh(i)+k1*h;
    k2 = f(t(i)+1,yh(i+1));
    k = (k1+k2)/2;
    yh(i+1)=yh(i)+k*h;
end
end

function [yrk] = myrk(f,t,yo) 
h = 0.5; n = length(t);
yrk = zeros(n,1); yrk(1) = yo;
for i = 1:n-1
    k1 = f(t(i),yrk(i));
    k2 = f(t(i)+.5*h,yrk(i)+k1*h/2);
    k3 = f(t(i)+.5*h, yrk(i)+k2*h/2);
    k4 = f(t(i)+1, yrk(i)+k3*h);
    k = (k1+2*k2+2*k3 + k4)/6;
    yrk(i+1)=yrk(i)+k*h;
end
end


