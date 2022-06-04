function[] = HW04Problem1a()
x0=[2  2];
t=1;
while t == 1
    J=[9*x0(1)^2 , 8*x0(2); 8*x0(1) , -3*x0(2)^2];
    f=[3*x0(1)^3+4*x0(1)^2-145 , 4*x0(2)^2-x0(2)^3+28];
    x = x0 - f/J;
    if abs(x0-x)<.00001
    t= 2;
    else
    t=1;
    end 
    x0=x;
end
x
end