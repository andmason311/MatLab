function[]=HW06Problem4B()
L = 0:0.8:4;
time = [0 5];

y0 = zeros(1, 6);
y0(1) = 42;
y0(6) = 42;
 
[t, y] = ode45(@HW06Problem4A, time, y0);
[L, t] = meshgrid(L, t);
 
surf(L, t, y)
end
