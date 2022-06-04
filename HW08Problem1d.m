function [] = HW08Problem1d()
span=[0 10];
bd = [240 150];
n = 9;
a = span(1);
b = span(2);
h = (b-a)/(n+1);
W = zeros(n,1);
for i = 1:20
    W = W-HW08Problem1e(W,span,bd,n)\HW08Problem1f(W,span,bd,n);
end
plot([0,(1:9),10],[240,W',150]);
xlable('x');
ylable('T');
title('Approximation solutions of BVP by the Finite Difference Method');
end