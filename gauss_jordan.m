% Define functions for A and b.  Note: this form of defining a 
% function is called an anonymous function.  The result of the
% statement on the right, assigned to the variable on the left,
% A_func, is what is known as a function handle.  Type
%   >> help function_handle for more information.
%
% You could have also defined a function, in a separate MATLAB
% file for this question.

A_func = @(b,d) [1 zeros(1,7);               ...
                 1/b -(d+1) d zeros(1,5);    ...
                 0 1 -(d+1) d zeros(1,4);    ...
                 0 0 1 -(d+1) d zeros(1,3);  ...
                 zeros(1,3) 1 -(d+1) d 0 0;  ...
                 zeros(1,4) 1 -(d+1) d 0;    ...
                 zeros(1,6) 1 0;             ...
                 zeros(1,5) -b 0 1];

% y_F, x_1, x_2, x_3, x_4, x_5, x_Feed, y_5 (outlet gas conc)
b_func = @(y_F,x_F) [y_F, 0, 0, 0, 0, 0, x_F, 0]';

% Case I:
G = 130; 
L = 150;     % or use 50.0
B = 0.9; 
d = L/(G*B); 
y_0 = 0.55; 
x_0 = 0.001;
A = A_func(B, d);
b = b_func(y_F,x_F);
x = A\b;

% Check: norm(A*x - b)  = 0.0
x = x * 100;
fprintf('Gas_exit = %f\n', x(8))
fprintf ('Gas_0 = %f\n', x(1))
fprintf(['Liquid concentration profile: top to bottom: %f, ' ...
          '%f, %f, %f, %f, %f\n'], x(7), x(6), x(5), x(4), x(3), x(2))