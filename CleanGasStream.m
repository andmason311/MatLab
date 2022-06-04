function[]=CleanGasStream
R1 = input('What size of square matrix do you want? ');
B=0.9;
b = 1/B;
G = 130;
L = 150;
y0 = 0.55;
x51 = 0.001;
o = L/(G*B);
d = -((L/(G*B))+1);
%% Populate A Matrix
A = ones(R1,R1);
for i = 1:R1
    for j = 1:R1
        if i == 1 && j == 1
            A(i,j) = b;
        elseif i == j
            A(i,j) = 1;
        elseif (i-j) == 1
            A(j,i) = d;
        elseif(i-j) == 2
            A(j,i) = o;
        else 
            A(j,i) = 0;
        end
    end
end
%% Populate B Matrix
B = ones(R1,1);
for i = 1:R1     
        if i == 1
            B(1,i) = 0.55;
        elseif i == 50
            B(1,i) = 0.001;
        else
            B(1,i) = 0;
        end
end
%% Plotting Results
C = [A,B];
L = rref(C);
n = 1:R1;
D = L(1:R1,R1+1);
plot(n,D)
%% Answers
disp('Tray 1 0=x4-(o+1)*x1+o*x2')
disp('Tray 2 0=x1-(o+1)*x2+o*x3')
disp('Tray 3 0=x2-(o+1)*x3+o*x4')
disp('Where o=L/(G*B)')
A=A(1:5,1:5)
B=B(1:5)
disp('32 Trays are needed to reach a liquid mol fraction .0011')
