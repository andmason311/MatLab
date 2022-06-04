function[] = Gauss_Jordon(A,B)
%% Check the dimensions of the inputN = size(A,1); % number of rows in matrix A
N = size(A,1); % number of rows in matrix A
M = size(A,2); % number of columns in matrix A
if N ~= M % matrix is not square
    error('Input matrix A is not square.');
    return;
end
if size(B) ~= [N,1]
    error('Size of input vector b is inconsistent with matrix A.');
    return;
end

%% Perform elementary row operations
for i = 1:N % iterate over columns from left to right
    %Partial Pivoting
%     j = i;
%     for k = i:N-1 % Find maximum element in column i (below diagonal)
%         if abs(A(k,i)) > abs(A(j,i))
%             j = k;
%         end
%     end
%     if j ~= i % interchange rows i and j
%         temp = A(i,:); % store row i in a temporary variable temp
%         A(i,:) = A(j,:);
%         A(j,:) = temp;
%         temp = B(i);
%         B(i) = B(j);
%         B(j) = temp;
%     end
    % Elementary Row Operations
    for j = i+1:N % iterate over rows below diagonal
        lambda = A(j,i) / A(i,i);
        for k = i:N % iterate in row j from column # i to right
            A(j,k) = A(j,k) - lambda*A(i,k);
        end
        B(j) = B(j) - lambda*B(i);
    end
end
%% Perform Reverse Elementary Analysis
% 
for i=3:-1:2
    for j=i-1:-1:1
lambda=A(j,i)/A(i,i);
A(j,:)= A(j,:)-A(i,:)*lambda;
B(j)=B(j)-B(i)*lambda;
    end
end


% lambda=A(2,3)/A(3,3);
% A(2,:)= A(2,:)-A(3,:)*lambda;
% B(2)=B(2)-B(3)*lambda;

% lambda=A(1,3)/A(3,3);
% A(1,:)=A(1,:)-A(3,:)*lambda;
% B(1)=B(1)-B(3)*lambda;
% 
% lambda=A(1,2)/A(2,2);
% A(1,:)=A(1,:)-A(2,:)*lambda;
% B(1)=B(1)-B(2)*lambda;

for i = 1:N
B(i)=B(i)/A(i,i);
A(i,:)=A(i,:)/A(i,i);
end

x1=B(1)
x2=B(2)
x3=B(3)