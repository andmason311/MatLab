function [x,y,u] = HW08Problem2()
% Solves the Laplace equation: uxx + uyy = 0 
%        on the square domain: 0 < x < 12, 0 < y < 12
%    with boundary conditions: u(0,y) = 50,  u(12,y) = 50
%                              u(x,0) = 100, u(x,12) = 0

% Boundary Conditions
u0y = 298;
uLy = 273-125;
ux0 = (20-125)/2 + 273;
uxL = 273-125;

% Domain
N=50;
nMax=100;
h = 12/(N-1);
x = 0:h:12; 
y = x;      

% Initialize u
u = 50*ones(N,N);
u(1,:) = u0y;
u(N,:) = uLy;
u(:,1) = ux0;
u(:,N) = uxL;

% Stencil
B = zeros(N-2,3);
B(:,1) = 1;
B(:,2) = -4;
B(:,3) = 1;
A = spdiags(B,[-1:1],N-2,N-2); % only for interior points

uNext = u;
for n = 1:nMax
    % Loop through rows j
    for j = 2:N-1
        rhs = -u(2:N-1,j-1) - u(2:N-1,j+1);
        rhs(1) = rhs(1) - u(1,j);  % boundary condition, x = 0
        rhs(end) = rhs(end) - u(N,j);  % boundary condition, x = 12
        uNext(2:N-1,j) = A\rhs;
    end
    u = uNext;
    
    % Loop through columns i
    for i = 2:N-1
        rhs = -u(i-1,2:N-1) - u(i+1,2:N-1);
        rhs(1) = rhs(1) - u(i,1);
        rhs(end) = rhs(end) - u(i,N);
        uNext(i,2:N-1) = A\rhs';
    end
    u = uNext;

end
disp('min of :')
disp(min(u));
disp('max of :')
disp(max(u));
surf(y,x,u);
end