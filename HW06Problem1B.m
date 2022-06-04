function[] = HW06Problem1B()
step = [0 10];
y0 = [0 4];
[t, y] = ode45(@HW06Problem1A, step, y0);
plot (t, y(:, 1));
pause(.01); 
plot(t, y(:, 2));
disp(y(101, :))
end
