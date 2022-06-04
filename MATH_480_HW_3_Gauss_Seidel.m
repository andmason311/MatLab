% HW 3 MECH 480
% Cass Amsden October 1st, 2021
% Gauss–Seidel Method in MATLAB

% Defining Given Data and Initial Conditions
A = [3 2 1; 2 3 2; 1 2 3];                                                 % Matrix A given
b = [1; 6; 10];                                                            % Matrix b given 
n=3;                                                                       % Number of Equations                                                           
x_int=ones(n,1);                                                          % Matrix x iniial condition
X = zeros(n,1);                                                            % Defining matrix for solutions
tolerance = 1E-6;                                                          % Tolerance of iterations
iterations = 10;                                                         % Number of iterations

 
 
 
 


% Separation of matrix A into lower triangular and upper triangular matrices
% A = D + L + U
DiagonalofMatrix = diag(diag(A));
LowerTriangle = tril(A)-DiagonalofMatrix;
UpperTriangle = triu(A)-DiagonalofMatrix;
% check for convergence condition for Gauss–Seidel method
error = max(eig(-inv(DiagonalofMatrix+LowerTriangle)*(UpperTriangle)));
if abs(error) >= 1
    disp ('The modulus of the largest Eigen value is not less than 1 and therefore does not converge')
    return
end
% allowable error in final answer
tol = tolerance*ones(n,1);
X(:,1) = x_int;
err = 1000000000*rand(n,1);% initial error assumption for looping
while sum(abs(err) >= tol) ~= zeros(n,1)
    X(:,iterations+1) = -inv(DiagonalofMatrix+LowerTriangle)*(UpperTriangle)*X(:,iterations)+inv(DiagonalofMatrix+LowerTriangle)*B;% Gauss-Seidel formula
    err = X(:,iterations+1)-X(:,iterations);% finding error
    iterations = iterations+1;   
end
% Print Out of Solution
fprintf ('The final answer obtained after %g iterations is  \n', iterations)
X(:,iterations)
