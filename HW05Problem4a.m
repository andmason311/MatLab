function[]=HW06Problem1B()
h = 0.1;
x = 1:0.01:10;
y = zeros(901, 2);
y(1, 1) = 0;
y(1, 2) = 4;
Yup = zeros(1001, 2);
 
for i = 2: 901
    Yup(i, 1) = -y(i-1, 1) + y(i-1, 2);
    Yup(i, 2) = -y(i-1, 1) - y(i-1, 2);
    y(i, 1) = h*Yup(i, 1) + y(i-1);
    y(i, 2) = h*Yup(i, 2) + y(i-1);
end
 
plot(x, y(:, 1))
hold on
plot(x, y(:, 2))
y(901, :);
end