function [] = HW08Problem1a

solinit = bvpinit([0 10],[240 240]);
sol = bvp4c(@HW08Problem1b,@HW08Problem1c,solinit);
x = [0 10];
y = deval(sol,x);
plot(x,y(1,:))

end