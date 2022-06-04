function[F,gradient] = HW05Problem2b(x)
F=10*x(1)^2+x(2)^2;
gradient=[20*x(1), 2*x(2)];