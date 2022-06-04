function x = tridiag(A,B,C,S,a,b,c); 

% Function tridiag:  
%  Create matrix A (Tridiagonal)and B(Right Hand Side Vector) for resultant
%  Matric C (Solution)
%  Function Form x=A*B
%  Matrix C and S are intermediate matrix forms to solve for matrix x
%  Inverts a tridiagonal system whose lower, main and upper diagonals with
%  in Matrix A are respectively given by the vectors a, b and c. B is the 
%  right-hand side, and n is the size of the system. The result is placed 
%  in C.  

n = 10;
A = zeros(n); 
B = zeros(n,1);
A(1,1) = 3;
A(2,1) = -1;
A(10,10) = 30;
A(9,10) = -10;
B(1) = 1;
B(10)=10;
for i = 2:n-1
    A(i-1,i) = -i;
    A(i+1,i) = -i;
    A(i,i) = 3*i; 
    B(i,1) = i; 
end 

% Start the decomposition and forward substitution 
a=zeros(1,n);
b=zeros(1,n-1);
c=zeros(1,n-1);
a(1)=A(1,1);
a(10)=A(10,10);
b(1)=A(2,1);
c(9)=A(9,10);
for m=2:n-1
   a(m)=A(m,m);
   b(m)=A(m+1,m);
   c(m-1)=A(m-1,m);
end

S(1)=b(1)/a(1);
for i=2:n-1
    S(i)=b(i)/(a(i)-c(i)*S(i-1));
end
C(1)=B(1)/a(1);
for i=2:n
    C(i)=(B(i)-c(i)*C(i-1))/(a(i)-c(i)*S(i-1));
end
x(n)=C(n);
for i=n-1:-1:1
    x(i)=C(i)-S(i)*x(i+1);
end

%{
for j = 2:n  
    gamma(j) = c(j-1)/beta ; 
    beta = b(j)-a(j)*gamma(j) ; 
    if (beta==0) 
        fprintf(1,'The tridiagonal solver failed...')  
        pause 
    end 
    C(j) = (r(j)-a(j)*C(j-1))/beta ;  
end 
 
% Perform the back substitution  
for j = 1:(n-1)     k = n-j ; 
    C(k) = C(k) - gamma(k+1)*C(k+1) ; 

end
%}
end