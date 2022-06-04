% HW 3 MECH 480
% Cass Amsden October 1st, 2021

% Defining Given Data and Initial Conditions
A = [3 2 1; 2 3 2; 1 2 3];                                                 % Matrix A given
b = [1; 6; 10];                                                            % Matrix b given 
A = [A,b];                                                                 % Combining Matrices
x_int=zeros(n,1);                                                          % Matrix x iniial condition
x = zeros(n,1);                                                            % Defining matrix for solutions
n=3;                                                                       % Number of Equations
tolerance = 1E-6;                                                          % Tolerance of iterations
iterations = 10;                                                         % Number of iterations

% Iteration Loop
k = 1;                                                                     % Loop Variable
 while k <= iterations
   err = 0;
   for i = 1 : n
      x_iteration = 0;
      for j = 1 : n
        x_iteration = x_iteration-A(i,j)*x_int(j);
      end
      x_iteration = (x_iteration+A(i,n+1))/A(i,i);
      if abs(x_iteration) > err
        err = abs(x_iteration);
      end
      x(i) = x_int(i)+x_iteration;
   end
  % Condition to Break Iteration Loop if Answer Converges Before iteration loop
  if err <= tolerance
     break;
  else
     k = k+1;
     for i = 1 : n
       x_int(i) = x(i);
     end
  end
 end
% Print Out of Solution
 fprintf('Solution vector after %d iterations is :\n', k-1);
 for i = 1 : n
    fprintf(' %11.8f \n', x(i));
 end