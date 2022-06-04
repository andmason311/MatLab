function[error,x,y]= HW05Problem1b()
cGuess=200;
cExact = 100;
alpha=.1;
TINY = 1e-10; 
rspan = [TINY,1];% domain
y0 = [77, cGuess];% solution at r = 0 
options = odeset('RelTol',1e-6);
% integration options% Integrate
[x,y] = ode45(@HW05Problem1bb,rspan,y0,options,alpha);
% Calculate Error
cCalc = y(end,1)

%error = cCalc -cExact;
end






