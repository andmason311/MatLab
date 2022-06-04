function [B] = GaussJordan(A)%% GaussJordan.m% Function performs Gauss-Jordan elimination to invert matrix
INPUT:%  A - square NxN matrix
OUTPUT:%  B - inverse of matrix A 
Check the dimensions of the inputN = size(A,1); 
% number of rows in matrix AM = size(A,2); 
% number of columns in matrix A
if N ~= M 
    matrix is not squareerror('Input matrix A is not square.');
    return;
end
Perform elementary row operations to put A in upper triangular formB = eye(N);
initialize B to identity matrixfor i = 1:N-1
iterate over columns from left to right
Partial Pivoting[val,j] = max(abs(A(i:N,i)));
find maximum element in column i below the diagonalif val < 1e-10error('Matrix is singular to working precision.')
return;
endif j ~= i
interchange rows i and jtemp = A(i,:);
store row i in a temporary variable tempA(i,:) = A(j,:);
A(j,:) = temp;temp = B(i,:);B(i,:) = B(j,:);B(j,:) = temp;
end
Elementary Row Operationsfor j = i+1:N
iterate over rows below diagonallambda = A(j,i) / A(i,i);A(j,i:N) = A(j,i:N) - lambda*A(i,i:N);B(j,:) = B(j,:) - lambda*B(i,:);endend
Perform more elementary row operations to get A into diagonal formfor i = N:-1:2
iterate over columns from right to left
Elementary Row Operationsfor j = i-1:-1:1 
iterate over rows above diagonallambda = A(j,i) / A(i,i);
A(j,i:N) = A(j,i:N) - lambda*A(i,i:N);B(j,:) = B(j,:) - lambda*B(i,:);
end
end
Normalize diagonal elements of A to 1for j = 1:N
iterate across all rowsB(j,:) = B(j,:)/A(j,j);A(j,j) = 1;
end