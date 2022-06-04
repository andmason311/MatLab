function[] = HW05Problem2()

amax = 10;     % Maximum Step Size
x0 = [1,1];   % Initial Guess
Nmax = 20;    % Number of steps
tol = .01;   % Tolerance on gradient
chi1 = 0.5;   % Between 0 and 1
chi2 = 0.6;   % Between chi1and 1%% Initialize Search
x = x0; % Make initial guess
[F,G] = HW05Problem2b(x); % Compute initial cost function and gradient
fprintf('Iteration %d:\tx1 = %f,\tx2 = %f\n',0,x(1),x(2)); % Print%% Iterate
for k = 1:Nmax
if abs(G) < tol % we've found the minimum
    break; % STOP the for loopend% Choose search direction
end
    p = -G / norm(G); % direction of steepest descent% Determine step size
    a = amax; % initialize to amax
    [Fnext,Gnext] = HW05Problem2b(x + a*p);
    while(Fnext >= F) || (abs(F-Fnext)/a < chi1*dot(G,p))...
            || (abs(dot(p,Gnext)) > chi2*abs(dot(p,G)))% Descent Criteria are not satisfied
        a = a/2;[Fnext,Gnext] = HW05Problem2b(x + a*p);
    end% Update
    x = x + a*p;
    F = Fnext;
    G = Gnext;
    fprintf('Iteration %d:\tx1 = %f,\tx2 = %f\n',k,x(1),x(2));
end
end