function[] = HW04Problem2bb()
x0 = [0,0,0,0,0,0,0,0,0]; % Initial Guess
options = optimset('Display','final','TolX',1e-5);
AB = fsolve(@HW04Problem2b,x0,options)
end
